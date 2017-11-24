/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Evento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rhau
 */

@Repository
public class EventoDAO extends Registros<Evento> {
    
    public EventoDAO() {
        setSqlInsercao("INSERT INTO evento (id_hemocentro, nome_evento, descricao_evento, data_evento, horario_evento, local_evento, cep_local_evento, qtd_agendamentos) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        setSqlAlteracao("UPDATE evento SET id_hemocentro = ?, nome_evento = ?, descricao_evento = ?, data_evento = ?, horario_evento = ?, local_evento = ?, cep_local_evento = ?, qtd_agendamentos = ? WHERE id_evento = ?");
        setSqlExclusao("DELETE FROM evento WHERE id_evento = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM evento WHERE id_evento = ?");
        setSqlBuscaPersonalizada("SELECT * FROM evento WHERE id_hemocentro = ?");
        setSqlBuscaTodos("SELECT * FROM evento ORDER BY data_evento ASC");
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Evento e) throws SQLException {
        ps.setInt(1, e.getHemocentro().getId());
        ps.setString(2, e.getNome());
        ps.setString(3, e.getDescricao());
        ps.setDate(4, new java.sql.Date(e.getData().getTime()));
        ps.setString(5, e.getHorario());
        ps.setString(6, e.getLocal());
        ps.setString(7, e.getCep());
        ps.setInt(8, e.getQtdAgendamentos());
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Evento e) throws SQLException {
        ps.setInt(1, e.getHemocentro().getId());
        ps.setString(2, e.getNome());
        ps.setString(3, e.getDescricao());
        ps.setDate(4, new java.sql.Date(e.getData().getTime()));
        ps.setString(5, e.getHorario());
        ps.setString(6, e.getLocal());
        ps.setString(7, e.getCep());
        ps.setInt(8, e.getQtdAgendamentos());
        ps.setInt(9, e.getId());
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Evento e) throws SQLException {
        ps.setInt(1, e.getId());
    }

    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Evento e) throws SQLException {
        ps.setInt(1, e.getHemocentro().getId());
    }
    
    @Override
    protected Evento preencher(ResultSet rs) throws SQLException {
        Evento e = new Evento();
        e.setId(rs.getInt("id_evento"));
        e.setHemocentro( new HemocentroDAO().buscarChavePrimaria(rs.getInt("id_hemocentro")) );
        e.setNome(rs.getString("nome_evento"));
        e.setDescricao(rs.getString("descricao_evento"));
        e.setData(rs.getDate("data_evento"));
        e.setHorario(rs.getString("horario_evento"));
        e.setLocal(rs.getString("local_evento"));
        e.setCep(rs.getString("cep_local_evento"));
        e.setQtdAgendamentos(rs.getInt("qtd_agendamentos"));
        return e;
    }

    @Override
    protected Collection<Evento> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Evento> eventos = new ArrayList<>();
        while (rs.next()) 
            eventos.add(preencher(rs));
        return eventos;
    }

}
