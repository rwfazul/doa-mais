/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author rhau
 */

@Controller
public class IndexController {
    
    @RequestMapping( value = {"", "/"} )
    public RedirectView home() {
        return new RedirectView("inicio", true); 
    }
    
    @RequestMapping("inicio")
    public String paginaInicial() {
        return "index";
    }
    
}
