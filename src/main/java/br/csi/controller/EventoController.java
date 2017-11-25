/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.AgendamentoDAO;
import br.csi.dao.EventoDAO;
import br.csi.model.Agendamento;
import br.csi.model.Doador;
import br.csi.model.Evento;
import br.csi.model.Usuario;
import br.csi.util.DateUtils;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author rhau
 */

@Controller
public class EventoController {
    
    @Autowired
    EventoDAO edao;
    @Autowired
    AgendamentoDAO adao;
    
    @RequestMapping("eventos")
    public String eventos(Model model, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Doador doador = new Doador(u.getId());
            Collection<Evento> eventosParticipados = new ArrayList<>();
            Collection<Evento> eventosAgendados = new ArrayList<>();
            String data = DateUtils.toString(new Date(), "yyyy-MM-dd");
            Date dataAtual = DateUtils.toDate(data, "yyyy-MM-dd");
            for (Agendamento a: adao.buscarPersonalizado(new Agendamento(doador))) {
                if (a.getEvento() != null) {
                    if ( a.getEvento().getData().before( dataAtual ) ) 
                        eventosParticipados.add(a.getEvento());
                    else
                        eventosAgendados.add(a.getEvento());
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
            Logger.getLogger(EventoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "eventos";
    }
    
    @RequestMapping("novoAgendamentoEvento")
    public String insereAgendamento(@RequestParam("id_evento") Integer id_evento, Model model, HttpSession session) {
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Evento evento = edao.buscarChavePrimaria(id_evento);
            Agendamento a = new Agendamento(); 
            a.setDoador(new Doador(u.getId()));
            a.setData(evento.getData());
            a.setFaixaHorario(evento.getHorario());
            a.setHemocentro(evento.getHemocentro());
            a.setEvento(evento);
            a.setObservacoes("Participando do evento \"" + evento.getNome() + "\".");
            adao.inserir(a);
        } catch (SQLException ex) {
            Logger.getLogger(EventoController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msg", "Erro: não foi possível realizar o agendamento.");
            return "eventos";
        }
        return "redirect:eventos";
    }
    
    @RequestMapping("deletarAgendamentoEvento")
    public String deletaAgendamento(@RequestParam("id_evento") Integer id_evento, Model model, HttpSession session) {
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Agendamento a = new Agendamento();
            a.setDoador(new Doador(u.getId()));
            for (Agendamento agendamento : adao.buscarPersonalizado(a))
                if (agendamento.getEvento() != null && agendamento.getEvento().getId().equals(id_evento))
                    adao.excluir(agendamento);
        } catch (SQLException ex) {
            Logger.getLogger(EventoController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msg", "Erro: não foi possível excluir o agendamento.");
            return "eventos";
        }
        return "redirect:eventos";
    }
    
}
