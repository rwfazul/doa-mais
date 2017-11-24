/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.AgendamentoDAO;
import br.csi.dao.DoadorDAO;
import br.csi.dao.EstatisticaDAO;
import br.csi.dao.EventoDAO;
import br.csi.dao.HemocentroDAO;
import br.csi.model.Agendamento;
import br.csi.model.Doador;
import br.csi.model.Estatistica;
import br.csi.model.Evento;
import br.csi.model.Usuario;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author rhau
 */

@Controller
public class PaginasController {
    
    @Autowired
    AgendamentoDAO adao;
    @Autowired
    HemocentroDAO hdao; 
    @Autowired
    DoadorDAO ddao;    
    @Autowired
    EventoDAO edao;
    @Autowired
    EstatisticaDAO sdao;
        
    @RequestMapping( value = {"", "/"} )
    public RedirectView home() {
        return new RedirectView("inicio", true); 
    }
    
    @RequestMapping("inicio")
    public String paginaInicial() {
        return "index";
    }
    
    @RequestMapping("minha-conta")
    public String dashboard(Model model, HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        try {
            model.addAttribute("estatisticas", calculaStats(sdao.buscarTodos()));
            session.setAttribute("hemocentros", hdao.buscarTodos());
        } catch (SQLException ex) {
            Logger.getLogger(PaginasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "dashboard";
    }
    
    @RequestMapping("meus-agendamentos")
    public String agendamentos(Model model, HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Doador doador = new Doador(u.getId());
            Collection<Agendamento> agendamentos = adao.buscarPersonalizado(new Agendamento(doador));
            Collection<Agendamento> passados = new ArrayList<>();
            Collection<Agendamento> futuros = new ArrayList<>();
            for (Agendamento agendamento : agendamentos) {
                if ( agendamento.getData().before(new Date()) ) 
                    passados.add(agendamento);
                else
                    futuros.add(agendamento);
            }
            model.addAttribute("agendamentosPassados", passados);
            model.addAttribute("agendamentosFuturos", futuros);
        } catch (SQLException ex) {
            Logger.getLogger(PaginasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "agendamentos";
    }

    @RequestMapping("hemocentros-parceiros")
    public String hemocentros(HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        return "hemocentros";
    }

    @RequestMapping("eventos")
    public String eventos(Model model, HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Doador doador = new Doador(u.getId());
            Collection<Evento> eventosParticipados = new ArrayList<>();
            Collection<Evento> eventosAgendados = new ArrayList<>();
            for (Agendamento a: adao.buscarPersonalizado(new Agendamento(doador))) {
                if (a.getEvento() != null) {
                    if ( a.getEvento().getData().after(new Date()) ) 
                        eventosAgendados.add(a.getEvento());
                    else
                        eventosParticipados.add(a.getEvento());
                }
            } 
            Collection<Evento> futuros = new ArrayList<>();
            for (Evento evento: edao.buscarTodos()) {
                if (! evento.getData().before(new Date()) ) {
                    Boolean emAgendamento = false;
                    for (Evento e : eventosAgendados) {
                        if ( evento.getId().equals(e.getId()) )
                            emAgendamento = true;
                    }
                    if (!emAgendamento)    
                        futuros.add(evento);
                }
            }        
            model.addAttribute("eventosParticipados", eventosParticipados);
            model.addAttribute("eventosAgendados", eventosAgendados);
            model.addAttribute("eventosFuturos", futuros);
        } catch (SQLException ex) {
            Logger.getLogger(PaginasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "eventos";
    }

    @RequestMapping("alertas")
    public String alertas(HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        return "alertas";
    }

    @RequestMapping("novo-agendamento")
    public String novo_agendamento(HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        return "novo-agendamento";
    }
    
    @RequestMapping("meu-perfil")
    public String meu_perfil(HttpSession session) {
        if ( !verifica_user(session) ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            session.setAttribute("doadorInfo", ddao.buscarChavePrimaria(u.getId()));
        } catch (SQLException ex) {
            Logger.getLogger(PaginasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "user-info";
    }
    
    @RequestMapping("cadastro-perfil")
    public String cadastro_perfil() {
        return "cadastro-perfil";
    }
    
    @RequestMapping("cadastro-doador")
    public String cadastro_doador() {
        return "cadastro-doador";
    }
    
    @RequestMapping("sign-out")
    public String deslogar(HttpSession session) {
        session.invalidate();
        return "index";
    }
    
    public Boolean verifica_user(HttpSession session) {
        return session.getAttribute("usuarioLogado") != null;
    }

    private Collection<Estatistica> calculaStats(Collection<Estatistica> buscarTodos) {
        Collection<Estatistica> estatisticas = new ArrayList<>();
        String tipos[] = { "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-" };
        for (String tipo : tipos) 
            estatisticas.add(new Estatistica(tipo, 0));
        
        Integer qtd_doacoes_total = 0;
        for (Estatistica e : buscarTodos)
            qtd_doacoes_total += e.getValor();
        
        for (Estatistica stats : estatisticas) {
            for (Estatistica e: buscarTodos) {
                if (e.getChave().contains(stats.getChave())) 
                    stats.setValor( Math.round((e.getValor() / qtd_doacoes_total) * 100) );
            }
        }        
        return estatisticas;
    }
    
}
