/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author rhau
 */

@Controller
public class HemocentroController {
    
    @RequestMapping("hemocentros-parceiros")
    public String hemocentros(HttpSession session) {
        if ( session.getAttribute("usuarioLogado") == null ) return "redirect:inicio";
        return "hemocentros";
    }
    
}
