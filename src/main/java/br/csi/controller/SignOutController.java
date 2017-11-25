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
public class SignOutController {
    
    @RequestMapping("sign-out")
    public String deslogar(HttpSession session) {
        session.invalidate();
        return "index";
    }
}
