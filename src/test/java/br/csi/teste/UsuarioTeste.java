/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.teste;

import br.csi.dao.UsuarioDAO;
import br.csi.model.Usuario;
import java.sql.SQLException;
import java.util.Collection;

/**
 *
 * @author rhau
 */
public final class UsuarioTeste {

    private static final UsuarioDAO udao = new UsuarioDAO();
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        listar();
        inserir(new Usuario("exemplo@mail.com", "umaSenha"));
        inserir(new Usuario("email@mail.com", "outraSenha"));
        listar();
        Usuario u1 = buscar(new Usuario("exemplo@mail.com", "umaSenha"));
        autentica(u1);
        u1.setSenha("novaSenha");
        autentica(u1);
        u1.setEmail("novoEmail@mail.com");
        alterar(u1);
        autentica(u1);
        listar();
        buscar(new Usuario("email@mail.com", null));
        Usuario u2 = buscar(new Usuario("email@mail.com", "outraSenha"));
        deletar(u2);
        listar();
    }
    
    private static void autentica(Usuario u) {
        System.out.println("Autenticando usuario " + u);
        if (udao.autenticar(u))
            System.out.println("Usuario autentificado...");
        else
            System.out.println("Falha na autentificação...");
    }
    
    private static void inserir(Usuario u) throws SQLException {
        System.out.println("\nInserindo usuario " + u);
        udao.inserir(u);
    }
    
    private static void alterar(Usuario u) throws SQLException {
        System.out.println("\nAlterando usuario " + u);
        udao.alterar(u);
    }
    
    private static void deletar(Usuario u) throws SQLException {
        System.out.println("\nDeletando usuario " + u);        
        udao.excluir(u);
    }
    
    private static Usuario buscar(Usuario u) throws SQLException { 
        System.out.println("\nBuscando usuario " + u); 
        Collection<Usuario> resultado = udao.buscarPersonalizado(u);
        Usuario busca = resultado.iterator().hasNext() ? resultado.iterator().next() : null;
        if (busca != null)
            System.out.println("encontrou = " + busca);
        else
            System.out.println("nao encontrou");
        return busca;
    }

    private static void listar() throws SQLException {
        System.out.println("\nListando usuarios...");
        for (Usuario u : udao.buscarTodos())
            System.out.println(u);
    }

}
