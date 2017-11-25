/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.EstatisticaDAO;
import br.csi.dao.HemocentroDAO;
import br.csi.model.Estatistica;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
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
public class DashboardController {
    
    @Autowired
    HemocentroDAO hdao; 
    @Autowired
    EstatisticaDAO sdao;
    
    @RequestMapping("minha-conta")
    public String dashboard(Model model, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        try {
            model.addAttribute("estatisticas", calculaEstatisticaDoacoes(sdao.buscarTodos()));
            session.setAttribute("hemocentros", hdao.buscarTodos());
        } catch (SQLException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "dashboard";
    }   
    
    private Collection<Estatistica> calculaEstatisticaDoacoes(Collection<Estatistica> buscarTodos) {
        Collection<Estatistica> estatisticas = new ArrayList<>();
        String tipos[] = { "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-" };
        Integer qtd_doacoes_total = 0;
        Integer arredondamento_control = 0;
        for (String tipo : tipos) estatisticas.add(new Estatistica(tipo, 0));
        for (Estatistica e : buscarTodos) qtd_doacoes_total += e.getValor();
        
        for (Estatistica stat : estatisticas) {
            for (Estatistica e: buscarTodos) {
                if (e.getChave().replaceAll("\\s","").equals(stat.getChave())) {
                    stat.setValor(Math.round(((float)  e.getValor() / qtd_doacoes_total) * 100));
                    arredondamento_control += stat.getValor();
                }
            }
        }       
        // fechar 100% exatos mesmo com os arredondamentos
        if (arredondamento_control != 100) {
            for (Estatistica stat: estatisticas) {
                if (stat.getValor() != 0) {
                    stat.setValor( (stat.getValor() + 100 - arredondamento_control) );
                    break;
                }
            }
        }
        return estatisticas;
    }
    
}
