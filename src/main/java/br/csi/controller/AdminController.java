/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.AdminDAO;
import br.csi.dao.HemocentroDAO;
import br.csi.dao.UsuarioDAO;
import br.csi.model.Admin;
import br.csi.model.Hemocentro;
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
public class AdminController {
    
    @Autowired
    UsuarioDAO udao;
    @Autowired
    AdminDAO adao;
    @Autowired
    HemocentroDAO hdao;
    
    @RequestMapping("dm-admin")
    public String admin() {
        return "admin";
    }
    
    @RequestMapping("admin-login")
    public String logar(Model model, Admin a, HttpSession session) {
        if ( !adao.autenticar(a) ) {
            session.removeAttribute("adminLogado");
            model.addAttribute("msg", "Erro: Login inválido.");
            return "admin";
        }
        try {
            session.setAttribute("adminLogado", adao.buscarPersonalizado(a).iterator().next());
            return "redirect:admin-dashboard";
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "admin";
    }
    
    @RequestMapping("admin-dashboard")
    public String adminDashboard(Model model, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";    
        try {
            model.addAttribute("hemocentros", hdao.buscarTodos());
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("page", "gerenciar-hemocentros.jsp");
        model.addAttribute("menuAtivo", "painel");
        return "admin-dashboard";
    }
    
    @RequestMapping("novo-hemocentro")
    public String novoHemocentro(Model model, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";            
        model.addAttribute("page", "novo-hemocentro.jsp");
        model.addAttribute("menuAtivo", "novo");
        return "admin-dashboard";
    }
    
    @RequestMapping("inserirHemocentro")
    public String inserirHemocetro(Model model, Hemocentro h, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";            
        try {
            hdao.inserir(h);
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msg", "Erro:");
            return "novo-hemocentro";
        }
        return "redirect:admin-dashboard";
    }
    
    @RequestMapping("alterarHemocentro")
    public String alterarHemocentro(Model model, @RequestParam("id_hemocentro") Integer id_hemocentro, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";            
        try {
            model.addAttribute("hemocentroUpdate", hdao.buscarChavePrimaria(id_hemocentro));
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            return "redirect:admin-dashboard";
        }
        model.addAttribute("page", "novo-hemocentro.jsp");
        model.addAttribute("menuAtivo", "painel");
        return "admin-dashboard";
    }
    
    @RequestMapping("salvarAlteracoesUpdate")
    public String salvarAlteracoesUpdate(Model model, Hemocentro h, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";            
        try {
            hdao.alterar(h);
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msg", "Erro:");
            return "novo-hemocentro";
        }
        return "redirect:admin-dashboard";
    }
    
    @RequestMapping("deletarHemocentro")
    public String deletarHemocentro(Model model, @RequestParam("id_hemocentro") Integer id_hemocentro, HttpSession session) {
        if (session.getAttribute("adminLogado") == null) return "redirect:inicio";    
        try {
            hdao.excluir(new Hemocentro(id_hemocentro));
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:admin-dashboard";
    }
    
}
