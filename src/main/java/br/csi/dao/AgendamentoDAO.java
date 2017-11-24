/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Agendamento;
import br.csi.model.Doador;
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
public class AgendamentoDAO extends Registros<Agendamento> {

    public AgendamentoDAO() {
        setSqlInsercao("INSERT INTO agendamento (id_doador, id_hemocentro, data_agendamento, faixa_horario, observacoes_agendamento, id_evento) VALUES (?, ?, ?, ?, ?, ?)");
        setSqlAlteracao("UPDATE agendamento SET id_doador = ?, id_hemocentro = ?, data_agendamento = ?, faixa_horario = ?, observacoes_agendamento = ?, id_evento = ? WHERE id_agendamento = ?");
        setSqlExclusao("DELETE FROM agendamento WHERE id_agendamento = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM agendamento WHERE id_agendamento = ?");
        setSqlBuscaPersonalizada("SELECT * FROM agendamento WHERE id_doador = ? ORDER BY data_agendamento ASC");
        setSqlBuscaTodos("SELECT * FROM agendamento");
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Agendamento a) throws SQLException {
        ps.setInt(1, a.getDoador().getId());
        ps.setInt(2, a.getHemocentro().getId());
        ps.setDate(3, new java.sql.Date(a.getData().getTime()));
        ps.setString(4, a.getFaixaHorario());
        ps.setString(5, a.getObservacoes());
        if (a.getEvento() != null)
            ps.setInt(6, a.getEvento().getId());
        else
            ps.setNull(6, java.sql.Types.INTEGER);
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Agendamento a) throws SQLException {
        ps.setInt(1, a.getDoador().getId());
        ps.setInt(2, a.getHemocentro().getId());
        ps.setDate(3, new java.sql.Date(a.getData().getTime()));
        ps.setString(4, a.getFaixaHorario());
        ps.setString(5, a.getObservacoes());
        if (a.getEvento() != null)
            ps.setInt(6, a.getEvento().getId());
        else
            ps.setNull(6, java.sql.Types.INTEGER);
        ps.setInt(7, a.getId());
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Agendamento a) throws SQLException {
        ps.setInt(1, a.getId());
    }

    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Agendamento a) throws SQLException {
        ps.setInt(1, a.getDoador().getId());
    }

    @Override
    protected Agendamento preencher(ResultSet rs) throws SQLException {
        Agendamento a = new Agendamento();
        a.setId(rs.getInt("id_agendamento"));
        a.setDoador(new Doador(rs.getInt("id_doador")));
        a.setHemocentro(new HemocentroDAO().buscarChavePrimaria(rs.getInt("id_hemocentro")));
        a.setData(rs.getDate("data_agendamento"));
        a.setFaixaHorario(rs.getString("faixa_horario"));
        a.setObservacoes(rs.getString("observacoes_agendamento"));
        Integer id_evento = rs.getInt("id_evento");
        if (id_evento != null && id_evento != 0) 
            a.setEvento(new EventoDAO().buscarChavePrimaria(id_evento));
        return a;
    }

    @Override
    protected Collection<Agendamento> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Agendamento> agendamentos = new ArrayList<>();
        while (rs.next()) 
            agendamentos.add(preencher(rs));
        return agendamentos;
    }

}
