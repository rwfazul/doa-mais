/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.AgendamentoDAO;
import br.csi.model.Agendamento;
import br.csi.model.Doador;
import br.csi.model.Hemocentro;
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
public class AgendamentoController {
    
    @Autowired
    AgendamentoDAO adao;
    
    @RequestMapping("meus-agendamentos")
    public String agendamentos(Model model, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Doador doador = new Doador(u.getId());
            Collection<Agendamento> agendamentos = adao.buscarPersonalizado(new Agendamento(doador));
            Collection<Agendamento> passados = new ArrayList<>();
            Collection<Agendamento> futuros = new ArrayList<>();
            String data = DateUtils.toString(new Date(), "yyyy-MM-dd");
            Date dataAtual = DateUtils.toDate(data, "yyyy-MM-dd");
            for (Agendamento agendamento : agendamentos) {
                if ( agendamento.getData().before( dataAtual ) ) 
                    passados.add(agendamento);
                else
                    futuros.add(agendamento);
            }
            model.addAttribute("agendamentosPassados", passados);
            model.addAttribute("agendamentosFuturos", futuros);
        } catch (SQLException ex) {
            Logger.getLogger(AgendamentoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "agendamentos";
    }
    
    @RequestMapping("novo-agendamento")
    public String novo_agendamento(HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        return "novo-agendamento";
    }
    
    @RequestMapping("inserirAgendamento")
    public String insereAgendamento(Model model, Agendamento a, HttpSession session, @RequestParam("id_hemocentro") Integer id_hemocentro, @RequestParam("data_agendamento") String dataAgendamento) {
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        a.setDoador(new Doador(u.getId()));
        a.setHemocentro(new Hemocentro(id_hemocentro));
        a.setData(DateUtils.toDate(dataAgendamento, "dd/MM/yyyy"));
        if (a.getObservacoes().isEmpty())
            a.setObservacoes("N/A");
        try {
            adao.inserir(a);
        } catch (SQLException ex) {
            Logger.getLogger(AgendamentoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:meus-agendamentos";
    }
    
    @RequestMapping("deletarAgendamento")
    public String removeAgendamento(@RequestParam("id_agendamento") Integer id_agendamento) {
        try {
            adao.excluir(new Agendamento(id_agendamento));
        } catch (SQLException ex) {
            Logger.getLogger(AgendamentoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:meus-agendamentos";
    }

}
