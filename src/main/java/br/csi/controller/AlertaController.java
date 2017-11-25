/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.AlertaDAO;
import br.csi.dao.DoadorDAO;
import br.csi.model.Alerta;
import br.csi.model.Doador;
import br.csi.model.Usuario;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author rhau
 */

@Controller
public class AlertaController {
 
    @Autowired
    AlertaDAO adao;
    @Autowired
    DoadorDAO ddao;   
    
    @RequestMapping("alertas")
    public String alertas(Model model, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            Doador d = ddao.buscarChavePrimaria(u.getId());
            Alerta a = new Alerta();
            a.setTipoSanguineo(d.getTipoSanguineo());
            model.addAttribute("alertasAtivosUser", adao.buscarPersonalizado(a));
        } catch (SQLException ex) {
            Logger.getLogger(AlertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "alertas";
    }
    
}
