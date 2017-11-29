/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Admin;
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
public class AdminDAO extends Registros<Admin> {
    
    public AdminDAO() {
        setSqlBuscaPersonalizada("SELECT * FROM admin_sistema INNER JOIN usuario ON id_usuario = id_admin WHERE login_admin = ? AND senha = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM admin_sistema WHERE id_admin = ?");
    }

    public Boolean autenticar(Admin a) {
        Boolean autenticado = false;
        try {
            autenticado = buscarPersonalizado(a).iterator().hasNext();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return autenticado;
    }
    
    @Override
    protected void preencherInsercao(PreparedStatement ps, Admin a) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Admin a) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Admin a) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Admin a) throws SQLException {
        ps.setString(1, a.getLogin());
        ps.setString(2, a.getSenha());
    }

    @Override
    protected Admin preencher(ResultSet rs) throws SQLException {
        Admin a = new Admin();
        a.setId(rs.getInt("id_admin"));
        a.setLogin(rs.getString("login_admin"));
        a.setEmail(rs.getString("email"));
        a.setSenha(rs.getString("senha"));
        return a;
    }

    @Override
    protected Collection<Admin> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Admin> admins = new ArrayList<>();
        while (rs.next())
            admins.add( preencher(rs) );
        return admins;
    }
    
}
