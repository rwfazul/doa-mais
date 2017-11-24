/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Doador;
import br.csi.model.Usuario;
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
public class DoadorDAO extends Registros<Doador> {

    UsuarioDAO usuariodao = new UsuarioDAO();

    public DoadorDAO() {
        setSqlInsercao("INSERT INTO doador (id_doador, nome_doador, cpf, data_nasc, sexo, celular, cep_doador, tipo_sanguineo, peso, ja_doou, ultima_doacao, medicamentos, observacoes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        setSqlAlteracao("UPDATE doador SET nome_doador = ?, cpf = ?, data_nasc = ?, sexo = ?, celular = ?, cep_doador = ?, tipo_sanguineo = ?, peso = ?, ja_doou = ?, ultima_doacao = ?, medicamentos = ?, observacoes = ? WHERE id_doador = ?");
        setSqlExclusao("DELETE FROM doador WHERE id_doador = ?");
        setSqlBuscaChavePrimaria("SELECT * FROM doador WHERE id_doador = ?");
        setSqlBuscaTodos("SELECT * FROM doador");
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Doador d) throws SQLException {
        ps.setInt(1, d.getId());
        ps.setString(2, d.getNome());
        ps.setString(3, d.getCpf());
        ps.setDate(4, new java.sql.Date(d.getDataNascimento().getTime()));
        ps.setString(5, d.getSexo());
        ps.setString(6, d.getCelular());
        ps.setString(7, d.getCep());
        ps.setString(8, d.getTipoSanguineo());
        ps.setInt(9, d.getPeso());
        ps.setBoolean(10, d.getJaDoou());
        ps.setString(11, d.getUltimaDoacao());
        ps.setString(12, d.getMedicamentos());
        ps.setString(13, d.getObservacoes());       
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Doador d) throws SQLException {
        ps.setString(1, d.getNome());
        ps.setString(2, d.getCpf());
        ps.setDate(3, new java.sql.Date(d.getDataNascimento().getTime()));
        ps.setString(4, d.getSexo());
        ps.setString(5, d.getCelular());
        ps.setString(6, d.getCep());
        ps.setString(7, d.getTipoSanguineo());
        ps.setInt(8, d.getPeso());
        ps.setBoolean(9, d.getJaDoou());
        ps.setString(10, d.getUltimaDoacao());
        ps.setString(11, d.getMedicamentos());
        ps.setString(12, d.getObservacoes());  
        ps.setInt(13, d.getId());
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Doador d) throws SQLException {
        ps.setInt(1, d.getId());
    }
    
    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Doador d) throws SQLException {
        new UsuarioDAO().preencherBuscaPersonalizada(ps, (Usuario) d);
    }

    @Override
    protected Doador preencher(ResultSet rs) throws SQLException {
        Doador d = new Doador();
        d.setId(rs.getInt("id_doador"));
        d.setNome(rs.getString("nome_doador"));
        d.setCpf(rs.getString("cpf"));
        d.setDataNascimento(rs.getDate("data_nasc"));
        d.setSexo(rs.getString("sexo"));
        d.setCelular(rs.getString("celular"));
        d.setCep(rs.getString("cep_doador"));
        d.setTipoSanguineo(rs.getString("tipo_sanguineo"));
        d.setPeso(rs.getInt("peso"));
        d.setJaDoou(rs.getBoolean("ja_doou"));
        d.setUltimaDoacao(rs.getString("ultima_doacao"));
        d.setMedicamentos(rs.getString("medicamentos"));
        d.setObservacoes(rs.getString("observacoes"));
        /*Agendamento a = new Agendamento();
        a.setDoador(d);
        d.getAgendamentos().addAll(new AgendamentoDAO().buscarPersonalizado(a));*/
        return d;
    }

    @Override
    protected Collection<Doador> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Doador> doadores = new ArrayList<>();
        while (rs.next())
            doadores.add(preencher(rs));
        return doadores;
    }
    
}
