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
import java.sql.SQLException;
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
    
    @RequestMapping("novoAgendamentoEvento")
    public String InsereAgendamento(@RequestParam("id_evento") Integer id_evento, Model model, HttpSession session) {
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
    
}
