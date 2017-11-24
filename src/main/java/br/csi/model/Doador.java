/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author rhau
 */
public class Doador extends Usuario implements Serializable {
    
    private String nome;
    private String cpf;
    private Date dataNascimento;
    private String sexo;
    private String celular;
    private String cep;
    private String tipoSanguineo;
    private Boolean jaDoou;
    private String ultimaDoacao;
    private Integer peso;
    private String medicamentos;
    private String observacoes;
    private Collection<Agendamento> agendamentos = new ArrayList<>();
    
    public Doador() {
        medicamentos = "";
        observacoes = "";
    }

    public Doador(Integer id) {
        super(id);
    }

    public Doador(String nome, String cpf, Date dataNascimento, String sexo, String celular, String cep, String tipoSanguineo, Boolean jaDoou, String ultimaDoacao, Integer peso, String medicamentos, String observacoes) {
        this.nome = nome;
        this.cpf = cpf;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.celular = celular;
        this.cep = cep;
        this.tipoSanguineo = tipoSanguineo;
        this.jaDoou = jaDoou;
        this.ultimaDoacao = ultimaDoacao;
        this.peso = peso;
        this.medicamentos = medicamentos;
        this.observacoes = observacoes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTipoSanguineo() {
        return tipoSanguineo;
    }

    public void setTipoSanguineo(String tipoSanguineo) {
        this.tipoSanguineo = tipoSanguineo;
    }

    public Boolean getJaDoou() {
        return jaDoou;
    }

    public void setJaDoou(Boolean jaDoou) {
        this.jaDoou = jaDoou;
    }

    public String getUltimaDoacao() {
        return ultimaDoacao;
    }

    public void setUltimaDoacao(String ultimaDoacao) {
        this.ultimaDoacao = ultimaDoacao;
    }

    public Integer getPeso() {
        return peso;
    }

    public void setPeso(Integer peso) {
        this.peso = peso;
    }

    public String getMedicamentos() {
        return medicamentos;
    }

    public void setMedicamentos(String medicamentos) {
        this.medicamentos = medicamentos;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public Collection<Agendamento> getAgendamentos() {
        return agendamentos;
    }

    public void setAgendamentos(Collection<Agendamento> agendamentos) {
        this.agendamentos = agendamentos;
    }

    @Override
    public String toString() {
        return "Doador{" + "nome=" + nome + ", cpf=" + cpf + ", dataNascimento=" + dataNascimento + ", sexo=" + sexo + ", celular=" + celular + ", cep=" + cep + ", tipoSanguineo=" + tipoSanguineo + ", jaDoou=" + jaDoou + ", ultimaDoacao=" + ultimaDoacao + ", peso=" + peso + ", medicamentos=" + medicamentos + ", observacoes=" + observacoes + ", agendamentos=" + agendamentos + '}';
    }

}
