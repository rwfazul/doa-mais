/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rhau
 */
@Repository
public class UsuarioDAO extends Registros<Usuario> {

    public UsuarioDAO() {
        setSqlInsercao("INSERT INTO usuario (email, senha) VALUES (?, ?)");
        setSqlAlteracao("UPDATE usuario SET email = ?, senha = ? WHERE id_usuario = ?");
        setSqlExclusao("DELETE FROM usuario WHERE id_usuario = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM usuario WHERE id_usuario = ?");
        setSqlBuscaPersonalizada("SELECT * FROM usuario WHERE email = ? AND senha = ?");
        setSqlBuscaTodos("SELECT * FROM usuario");
    }
    
    public Boolean autenticar(Usuario u) {
        Boolean autenticado = false;
        try {
            autenticado = buscarPersonalizado(u).iterator().hasNext();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return autenticado;
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Usuario u) throws SQLException {
        ps.setString(1, u.getEmail());
        ps.setString(2, u.getSenha());
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Usuario u) throws SQLException {
        ps.setString(1, u.getEmail());
        ps.setString(2, u.getSenha());
        ps.setInt(3, u.getId());
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Usuario u) throws SQLException {
        ps.setInt(1, u.getId());
    }
    
    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Usuario u) throws SQLException {
        ps.setString(1, u.getEmail());
        ps.setString(2, u.getSenha());
    }

    @Override
    protected Usuario preencher(ResultSet rs) throws SQLException {
        Usuario u = new Usuario();
        u.setId(rs.getInt("id_usuario"));
        u.setEmail(rs.getString("email"));
        u.setSenha(rs.getString("senha"));
        return u;
    }

    @Override
    protected Collection<Usuario> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Usuario> usuarios = new ArrayList<>();
        while (rs.next()) 
            usuarios.add(preencher(rs));
        return usuarios;
    }

}
