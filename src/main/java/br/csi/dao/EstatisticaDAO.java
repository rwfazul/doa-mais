/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.dao;

import br.csi.banco.Registros;
import br.csi.model.Estatistica;
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
public class EstatisticaDAO extends Registros<Estatistica> {
    
    public EstatisticaDAO() {
        setSqlBuscaChavePrimaria("SELECT tipo_sanguineo, COUNT(*) AS qtd FROM doador NATURAL JOIN agendamento GROUP BY tipo_sanguineo WHERE id_hemocentro = ?");
        setSqlBuscaTodos("SELECT tipo_sanguineo, COUNT(*) AS qtd FROM doador NATURAL JOIN agendamento GROUP BY tipo_sanguineo");
    }

    @Override
    protected void preencherInsercao(PreparedStatement ps, Estatistica t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherAlteracao(PreparedStatement ps, Estatistica t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherExclusao(PreparedStatement ps, Estatistica t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void preencherBuscaPersonalizada(PreparedStatement ps, Estatistica t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected Estatistica preencher(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected Collection<Estatistica> preencherColecao(ResultSet rs) throws SQLException {
        Collection<Estatistica> estatisticas = new ArrayList<>();
        while ( rs.next() ) {
            Estatistica e = new Estatistica();
            e.setChave(rs.getString("tipo_sanguineo"));
            e.setValor(rs.getInt("qtd"));
            estatisticas.add(e);
        }
        return estatisticas;
    }
    
}
