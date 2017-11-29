/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import br.csi.dao.DoadorDAO;
import br.csi.dao.UsuarioDAO;
import br.csi.model.Doador;
import br.csi.model.Usuario;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
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
public class DoadorController {

    @Autowired
    UsuarioDAO udao;
    @Autowired
    DoadorDAO ddao;
    
    @RequestMapping("meu-perfil")
    public String meu_perfil(HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        Usuario u = (Usuario) session.getAttribute("usuarioLogado");
        try {
            session.setAttribute("doadorInfo", ddao.buscarChavePrimaria(u.getId()));
        } catch (SQLException ex) {
            Logger.getLogger(DoadorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "user-info";
    }
    
    @RequestMapping("cadastro-perfil")
    public String cadastro_perfil() {
        return "cadastro-perfil";
    }
        
    @RequestMapping("cadastrarPerfil")
    public String cadastrarPerfil(Model model, Doador d, HttpServletRequest request, HttpSession session) {
        if (! validarDataNascimento(model, d, request) )
            return "cadastro-perfil";
        session.setAttribute("doador", d);        
        return "redirect:cadastro-doador";
    }

    @RequestMapping("cadastro-doador")
    public String cadastro_doador() {
        return "cadastro-doador";
    }
    
    @RequestMapping("cadastrarDoador")
    public String cadastrarDoador(Model model, Doador d, HttpSession session) {  
        if (session.getAttribute("doador") == null)
            return "index";
        
        Doador perfil = (Doador) session.getAttribute("doador");
        d.setId(perfil.getId());
        d.setNome(perfil.getNome());
        d.setCpf(perfil.getCpf());
        d.setDataNascimento(perfil.getDataNascimento());
        d.setSexo(perfil.getSexo());
        d.setCelular(perfil.getCelular());
        d.setCep(perfil.getCep());
        d.setJaDoou((d.getUltimaDoacao() != null));
        if (d.getMedicamentos().isEmpty())
            d.setMedicamentos("N/A");
        if (d.getObservacoes().isEmpty())
            d.setObservacoes("N/A");
        try {
            ddao.inserir(d);
        } catch (SQLException ex) {
            Logger.getLogger(DoadorController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("msgPerfil", "Erro: CPF já registrado.");
            return "cadastro-perfil";
        }
        session.removeAttribute("doador");
        session.removeAttribute("id_usuario");
        try {
            session.setAttribute("usuarioLogado", udao.buscarChavePrimaria(d.getId()));
        } catch (SQLException ex) {
            Logger.getLogger(DoadorController.class.getName()).log(Level.SEVERE, null, ex);
            return "index";
        }
        return "redirect:minha-conta";
    }
    
    @RequestMapping("editarPerfil")
    public String editarPerfil(Model model) {
        model.addAttribute("newTabActive", "perfil");
        model.addAttribute("editarPerfil", true);
        return "user-info";
    }
    
    @RequestMapping("salvarAlteracoesPerfil")
    public String salvarAlteracoesPerfil(Model model, Doador d, HttpServletRequest request, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";

        if (! validarDataNascimento(model, d, request) ) 
            return "user-info";

        Doador doador = (Doador) session.getAttribute("doadorInfo");
        doador.setNome(d.getNome());
        doador.setCpf(d.getCpf());
        doador.setDataNascimento(d.getDataNascimento());
        doador.setSexo(d.getSexo());
        doador.setCelular(d.getCelular());
        doador.setCep(d.getCep());
        try {
            ddao.alterar(doador);
            session.setAttribute("doadorInfo", doador);
        } catch (SQLException ex) {
            Logger.getLogger(DoadorController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("editarPerfil", true);
            model.addAttribute("msg", "Erro: Existem dados inválidos.");
        } 
        return "user-info";
    }
    
    @RequestMapping("editarDoador")
    public String editarDoador(Model model) {
        model.addAttribute("newTabActive", "doador");
        model.addAttribute("editarDoador", true);
        return "user-info";
    }
    
    @RequestMapping("salvarAlteracoesDoador")
    public String salvarAlteracoesDoador(Model model, Doador d, HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        if (d.getMedicamentos().isEmpty())
            d.setMedicamentos("Não");
        if (d.getObservacoes().isEmpty())
            d.setObservacoes("N/A");
        Doador doador = (Doador) session.getAttribute("doadorInfo");
        doador.setTipoSanguineo(d.getTipoSanguineo());
        doador.setPeso(d.getPeso());
        doador.setMedicamentos(d.getMedicamentos());
        doador.setObservacoes(d.getObservacoes());
        try {
            ddao.alterar(doador);
            session.setAttribute("doadorInfo", doador);
        } catch (SQLException ex) {
            Logger.getLogger(DoadorController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("editarDoador", true);
            model.addAttribute("msg", "Erro: Existem dados inválidos.");
        }
        return "user-info";
    }
    
    private Boolean validarDataNascimento(Model model, Doador d, HttpServletRequest request) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String dia = request.getParameter("dia");
            String mes = request.getParameter("mes");
            String ano = request.getParameter("ano");
            String nascimento = ano + "-" + mes + "-" + dia;
            d.setDataNascimento( sdf.parse(nascimento) );            
            if ( d.getDataNascimento().after( new Date() ) ) {
                model.addAttribute("editarPerfil", true);
                model.addAttribute("msg", "Erro: Data de nascimento maior que data atual.");
                return false;
            }
        } catch (ParseException ex) {
            model.addAttribute("editarPerfil", true);
            model.addAttribute("msg", "Erro: Data de nascimento inválida.");
            return false;
        }
        return true;
    }
    
}
