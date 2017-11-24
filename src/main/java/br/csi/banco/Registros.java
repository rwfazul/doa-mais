/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.banco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rhau
 * @param <T>
 */
public abstract class Registros<T extends Registro> {

    private String sqlInsercao;
    private String sqlAlteracao;
    private String sqlExclusao;
    private String sqlBuscaChavePrimaria;
    private String sqlBuscaPersonalizada;
    private String sqlBuscaTodos;

    public String getSqlInsercao() {
        return sqlInsercao;
    }

    public void setSqlInsercao(String sqlInsercao) {
        this.sqlInsercao = sqlInsercao;
    }

    public String getSqlAlteracao() {
        return sqlAlteracao;
    }

    public void setSqlAlteracao(String sqlAlteracao) {
        this.sqlAlteracao = sqlAlteracao;
    }

    public String getSqlExclusao() {
        return sqlExclusao;
    }

    public void setSqlExclusao(String sqlExclusao) {
        this.sqlExclusao = sqlExclusao;
    }

    public String getSqlBuscaChavePrimaria() {
        return sqlBuscaChavePrimaria;
    }

    public void setSqlBuscaChavePrimaria(String sqlBusca) {
        this.sqlBuscaChavePrimaria = sqlBusca;
    }

    public String getSqlBuscaPersonalizada() {
        return sqlBuscaPersonalizada;
    }

    public void setSqlBuscaPersonalizada(String sqlBuscaPersonalizada) {
        this.sqlBuscaPersonalizada = sqlBuscaPersonalizada;
    }

    public String getSqlBuscaTodos() {
        return sqlBuscaTodos;
    }

    public void setSqlBuscaTodos(String sqlBuscaTodos) {
        this.sqlBuscaTodos = sqlBuscaTodos;
    }

    public Connection abrir() {
        Connection c = null;
        try {
            Class.forName(BD.JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            Logger.getLogger(Registros.class.getName()).log(Level.SEVERE, null, e);
            System.out.println("Nao encontrou o driver chamado " + BD.JDBC_DRIVER + " na memoria");
        }
        try {
            c = DriverManager.getConnection(BD.URL_CONEXAO, BD.USUARIO, BD.SENHA);
        } catch (SQLException e) {
            Logger.getLogger(Registros.class.getName()).log(Level.SEVERE, null, e);
        }

        return c;
    }

    /**
     * @param t
     * @return id do elemento inserido
     * @throws java.sql.SQLException
     */    
    public Integer inserir(T t) throws SQLException {
        Integer id = null;
        Connection c = abrir();
        PreparedStatement ps = c.prepareStatement(getSqlInsercao(), PreparedStatement.RETURN_GENERATED_KEYS);
        preencherInsercao(ps, t);
        ps.execute();
        ResultSet rs = ps.getGeneratedKeys();
        if ( rs.next() )
            id = rs.getInt(1); // pk
        rs.close();
        ps.close();
        c.close();
        return id;
    }

    public void alterar(T t) throws SQLException {
        Connection c = abrir();
        PreparedStatement ps = c.prepareStatement(getSqlAlteracao());
        preencherAlteracao(ps, t);
        ps.execute();
        ps.close();
        c.close();
    }

    public void excluir(T t) throws SQLException {
        Connection c = abrir();
        PreparedStatement ps = c.prepareStatement(getSqlExclusao());
        preencherExclusao(ps, t);
        ps.execute();
        ps.close();
        c.close();
    }

    public Collection<T> buscarPersonalizado(T t) throws SQLException {
        Connection c = abrir();
        PreparedStatement ps = c.prepareStatement(getSqlBuscaPersonalizada());
        preencherBuscaPersonalizada(ps, t);
        ResultSet rs = ps.executeQuery();
        Collection<T> registros = preencherColecao(rs);
        rs.close();
        ps.close();
        c.close();
        return registros;
    }

    public T buscarChavePrimaria(Integer chavePrimaria) throws SQLException {
        Connection c = abrir();
        T temp = null;
        PreparedStatement ps = c.prepareStatement(getSqlBuscaChavePrimaria());
        ps.setInt(1, chavePrimaria);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) 
            temp = preencher(rs);
        rs.close();
        ps.close();
        c.close();
        return temp;
    }

    public Collection<T> buscarTodos() throws SQLException {
        Connection c = abrir();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery(getSqlBuscaTodos());
        Collection<T> registros = preencherColecao(rs);
        rs.close();
        c.close();
        return registros;
    }

    protected abstract void preencherInsercao(PreparedStatement ps, T t) throws SQLException;

    protected abstract void preencherAlteracao(PreparedStatement ps, T t) throws SQLException;

    protected abstract void preencherExclusao(PreparedStatement ps, T t) throws SQLException;

    protected abstract void preencherBuscaPersonalizada(PreparedStatement ps, T t) throws SQLException;

    protected abstract T preencher(ResultSet rs) throws SQLException;

    protected abstract Collection<T> preencherColecao(ResultSet rs) throws SQLException;

}
