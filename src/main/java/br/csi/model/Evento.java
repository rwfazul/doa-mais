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
public class Evento extends Registro {

    private Integer id;
    private String nome;
    private String descricao;
    private Date data;
    private String horario;
    private String local;
    private String cep;
    private Integer qtdAgendamentos;
    private Hemocentro hemocentro;

    public Evento() {
        
    }

    public Evento(Integer id) {
        this.id = id;
    }

    public Evento(String nome, String descricao, Date data, String horario, String local, String cep, Integer qtdAgendamentos, Hemocentro hemocentro) {
        this.nome = nome;
        this.descricao = descricao;
        this.data = data;
        this.horario = horario;
        this.local = local;
        this.cep = cep;
        this.qtdAgendamentos = qtdAgendamentos;
        this.hemocentro = hemocentro;
    }

    public Evento(Integer id, String nome, String descricao, Date data, String horario, String local, String cep, Integer qtdAgendamentos, Hemocentro hemocentro) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.data = data;
        this.horario = horario;
        this.local = local;
        this.cep = cep;
        this.qtdAgendamentos = qtdAgendamentos;
        this.hemocentro = hemocentro;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Integer getQtdAgendamentos() {
        return qtdAgendamentos;
    }

    public void setQtdAgendamentos(Integer qtdAgendamentos) {
        this.qtdAgendamentos = qtdAgendamentos;
    }

    public Hemocentro getHemocentro() {
        return hemocentro;
    }

    public void setHemocentro(Hemocentro hemocentro) {
        this.hemocentro = hemocentro;
    }

    @Override
    public String toString() {
        return "Evento{" + "id=" + id + ", nome=" + nome + ", descricao=" + descricao + ", data=" + data + ", horario=" + horario + ", local=" + local + ", cep=" + cep + ", qtdAgendamentos=" + qtdAgendamentos + ", hemocentro=" + hemocentro + '}';
    }
        
}