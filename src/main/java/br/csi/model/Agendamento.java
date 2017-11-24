/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.model;

import br.csi.banco.Registro;
import java.util.Date;

/**
 *
 * @author rhau
 */
public class Agendamento extends Registro {

    private Integer id;
    private Doador doador;
    private Hemocentro hemocentro;
    private Date data;
    private String faixaHorario;
    private String observacoes;
    private Evento evento;

    public Agendamento() {
        this.observacoes = "";
    }
    
    public Agendamento(Integer id) {
        this.id = id;
    }    
    
    public Agendamento(Doador doador) {
        this.doador = doador;
    }

    public Agendamento(Doador doador, Hemocentro hemocentro, Date data, String faixaHorario, String observacoes) {
        this.doador = doador;
        this.hemocentro = hemocentro;
        this.data = data;   
        this.faixaHorario = faixaHorario;
        this.observacoes = observacoes;
    }
        
    public Agendamento(Integer id, Doador doador, Hemocentro hemocentro, Date data, String faixaHorario, String observacoes) {
        this.id = id;
        this.doador = doador;
        this.hemocentro = hemocentro;
        this.data = data;
        this.faixaHorario = faixaHorario;
        this.observacoes = observacoes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Usuario getDoador() {
        return doador;
    }

    public void setDoador(Doador doador) {
        this.doador = doador;
    }

    public Hemocentro getHemocentro() {
        return hemocentro;
    }

    public void setHemocentro(Hemocentro hemocentro) {
        this.hemocentro = hemocentro;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getFaixaHorario() {
        return faixaHorario;
    }

    public void setFaixaHorario(String faixaHorario) {
        this.faixaHorario = faixaHorario;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public Evento getEvento() {
        return evento;
    }

    public void setEvento(Evento evento) {
        this.evento = evento;
    }

    @Override
    public String toString() {
        return "Agendamento{" + "id=" + id + ", doador=" + doador + ", hemocentro=" + hemocentro + ", data=" + data + ", faixaHorario=" + faixaHorario + ", observacoes=" + observacoes + ", evento=" + evento + '}';
    }

}
