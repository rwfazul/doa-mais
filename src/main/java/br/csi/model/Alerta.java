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
public class Alerta extends Registro {
    
    private Integer id;
    private Hemocentro hemocentro;
    private String tipoSanguineo;
    private Date data;
    private Boolean aberto;
    private Integer objetivo;
    private String informacoes;

    public Alerta() {
        
    }
    
    public Alerta(Integer id) {
        this.id = id;
    }
    
    public Alerta(Hemocentro hemocentro, String tipoSanguineo, Date data, Boolean status, Integer objetivo, String informacoes) {
        this.hemocentro = hemocentro;
        this.tipoSanguineo = tipoSanguineo;
        this.data = data;
        this.aberto = status;
        this.objetivo = objetivo;
        this.informacoes = informacoes;
    }

    public Alerta(Integer id, Hemocentro hemocentro, String tipoSanguineo, Date data, Boolean status, Integer objetivo, String informacoes) {
        this.id = id;
        this.hemocentro = hemocentro;
        this.tipoSanguineo = tipoSanguineo;
        this.data = data;
        this.aberto = status;
        this.objetivo = objetivo;
        this.informacoes = informacoes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Hemocentro getHemocentro() {
        return hemocentro;
    }

    public void setHemocentro(Hemocentro hemocentro) {
        this.hemocentro = hemocentro;
    }

    public String getTipoSanguineo() {
        return tipoSanguineo;
    }

    public void setTipoSanguineo(String tipoSanguineo) {
        this.tipoSanguineo = tipoSanguineo;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Boolean getAberto() {
        return aberto;
    }

    public void setAberto(Boolean aberto) {
        this.aberto = aberto;
    }

    public Integer getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(Integer objetivo) {
        this.objetivo = objetivo;
    }

    public String getInformacoes() {
        return informacoes;
    }

    public void setInformacoes(String informacoes) {
        this.informacoes = informacoes;
    }

    @Override
    public String toString() {
        return "Alerta{" + "id=" + id + ", hemocentro=" + hemocentro + ", tipoSanguineo=" + tipoSanguineo + ", data=" + data + ", status=" + aberto + ", objetivo=" + objetivo + ", informacoes=" + informacoes + '}';
    }

}
