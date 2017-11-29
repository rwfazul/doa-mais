/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.UsuarioDAO;
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
public class UsuarioController {
    
    @Autowired
    UsuarioDAO udao;
    
    private final Integer tamanhoMinimoSenha = 6;
    
    @RequestMapping("logarUsuario")
    public String autenticarLogin(Model model, Usuario u, HttpSession session) {
        if ( parametroVazio(u.getEmail(), model, "email-login", "Por favor, insira seu email.") ||
             parametroVazio(u.getSenha(), model, "senha-login", "Por favor, insira sua senha.") ) {
                 return "index";   
        }
        if ( !udao.autenticar(u) ) {
            session.removeAttribute("usuarioLogado");
            model.addAttribute("msg", "{ 'id':'email-login', 'alerta':'Email ou senha inválidos.' }");        
            return "index";
        }
        try {
            session.setAttribute("usuarioLogado", udao.buscarPersonalizado(u).iterator().next());
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            return "index";
        }
        return "redirect:minha-conta";
    }
   
    @RequestMapping("cadastrarUsuario")
    public String novoUsuario(Model model, Usuario u, @RequestParam("confirmacao") String confirmacaoSenha, HttpSession session) {        
        if (! validarInfoUsuario(u, model, confirmacaoSenha) )
            return "index";
        try {
            Integer id = udao.inserir(u); 
            session.setAttribute("id_usuario", id);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msg", "{ 'id':'email', 'alerta':'Email já cadastrado.' }");
            return "index";
        }
        
        return "forward:cadastro-perfil";
    }
    
    @RequestMapping("editarUsuario")
    public String editarUsuario(Model model, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        model.addAttribute("newTabActive", "conta");
        model.addAttribute("editarConta", true);
        return "user-info";
    }
    
    @RequestMapping("salvarAlteracoesUser") 
    public String salvarAlteracoesUser(Model model, Usuario u, @RequestParam("confirmacao") String confirmacaoSenha, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        model.addAttribute("newTabActive", "conta");
        if (! validarInfoUsuario(u, model, confirmacaoSenha) ) {
            model.addAttribute("editarConta", true);
            return "user-info";
        }
        
        Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
        u.setId(userLogado.getId());
        try {
            udao.alterar(u);
            session.setAttribute("usuarioLogado", u);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("editarConta", true);
            model.addAttribute("msg", "{ 'id':'email', 'alerta':'Email já cadastrado.' }");
        }
        return "user-info";
    }
    
    @RequestMapping("deletarUsuario")
    public String deletarUsuario(Model model, @RequestParam("confirmacao-senha") String confirmacaoSenha, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
        if ( !userLogado.getSenha().equals(confirmacaoSenha) ) {
            model.addAttribute("msgErrorDelete", "Erro: Senha inválida.");
            return "user-info";
        }
        try {
            udao.excluir(userLogado);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msgErrorDelete", "Erro: Não foi possível deletar a conta.");
            return "user-info";
        }
        return "redirect:sign-out";
    }
    
    private Boolean validarInfoUsuario(Usuario u, Model model, String confirmacaoSenha) {
        if ( parametroVazio(u.getEmail(), model, "email", "Por favor, insira seu email.") ||
             parametroVazio(u.getSenha(), model, "email", "Por favor, insira sua senha.") ||
             parametroVazio(confirmacaoSenha, model, "email", "Por favor, confirme sua senha.") ) {
            return false;
        }
        
        if ( u.getSenha().length() < tamanhoMinimoSenha) {
            model.addAttribute("msg", "{ 'id':'senha', 'alerta':'A senha deve possuir ao mínimo 6 caracteres.' }");
            return false;            
        }
        
        if ( !u.getSenha().equals(confirmacaoSenha) ) {
            model.addAttribute("msg", "{ 'id':'confirmacao', 'alerta':'As senhas não conferem.' }");
            return false;
        }
        return true;
    }
    
    private Boolean parametroVazio(String parametro, Model model, String idParametro, String alerta) {    
        if ( parametro.isEmpty() ) {
            model.addAttribute("msg", "{ 'id':'" + idParametro + "', 'alerta':'" + alerta + "' }");
            return true;
        }
        return false;
    }

}
