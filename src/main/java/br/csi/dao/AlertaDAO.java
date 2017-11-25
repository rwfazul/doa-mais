/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Alerta;
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
public class AlertaDAO extends Registros<Alerta> {
    
    public AlertaDAO() {
        setSqlInsercao("INSERT INTO alerta (id_hemocentro, tipo_sanguineo, data_alerta, alerta_aberto, objetivo_doacoes, info_extra) VALUES (?, ?, ?, ?, ?, ?)");
        setSqlAlteracao("UPDATE alerta SET id_hemocentro = ?, tipo_sanguineo = ?, data_alerta = ?, alerta_aberto = ?, objetivo_doacoes = ?, info_extra = ? WHERE id_alerta = ?");
        setSqlExclusao("DELETE FROM alerta WHERE id_alerta = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM alerta WHERE id_alerta = ?");
        setSqlBuscaPersonalizada("SELECT * FROM alerta WHERE tipo_sanguineo = ? AND alerta_aberto =  true");
        setSqlBuscaTodos("SELECT * FROM alerta");
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Alerta a) throws SQLException {
        ps.setInt(1, a.getHemocentro().getId());
        ps.setString(2, a.getTipoSanguineo());
        ps.setDate(3, new java.sql.Date(a.getData().getTime()));
        ps.setBoolean(4, a.getAberto());
        ps.setInt(5, a.getObjetivo());
        ps.setString(6, a.getInformacoes());
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Alerta a) throws SQLException {
        ps.setInt(1, a.getHemocentro().getId());
        ps.setString(2, a.getTipoSanguineo());
        ps.setDate(3, new java.sql.Date(a.getData().getTime()));
        ps.setBoolean(4, a.getAberto());
        ps.setInt(5, a.getObjetivo());
        ps.setString(6, a.getInformacoes());
        ps.setInt(7, a.getId());
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Alerta a) throws SQLException {
        ps.setInt(1, a.getId());
    }

    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Alerta a) throws SQLException {
        ps.setString(1, a.getTipoSanguineo());
    }

    @Override
    protected Alerta preencher(ResultSet rs) throws SQLException {
        Alerta a = new Alerta();
        a.setId(rs.getInt("id_alerta"));
        a.setHemocentro( new HemocentroDAO().buscarChavePrimaria(rs.getInt("id_hemocentro")) );
        a.setTipoSanguineo(rs.getString("tipo_sanguineo"));
        a.setData(rs.getDate("data_alerta"));
        a.setAberto(rs.getBoolean("alerta_aberto"));
        a.setObjetivo(rs.getInt("objetivo_doacoes"));
        a.setInformacoes(rs.getString("info_extra"));
        return a;    
    }

    @Override
    protected Collection<Alerta> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Alerta> alertas = new ArrayList<>();
        while (rs.next())
            alertas.add(preencher(rs));
        return alertas;    
    }
    
}
