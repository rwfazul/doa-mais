/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.csi.model;

import br.csi.banco.Registro;
import java.io.Serializable;

/**
 *
 * @author rhau
 */

public class Estatistica extends Registro implements Serializable {
    
    private String chave;
    private Integer valor;

    public Estatistica() {
  
    }
    
    public Estatistica(String chave, Integer valor) {
        this.chave = chave;
        this.valor = valor;
    }

    public String getChave() {
        return chave;
    }

    public void setChave(String chave) {
        this.chave = chave;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "Estatistica{" + "chave=" + chave + ", valor=" + valor + '}';
    }
    
}
