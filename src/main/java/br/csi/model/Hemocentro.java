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
public class Hemocentro extends Registro implements Serializable {

    private Integer id;
    private String nome;
    private String endereco;
    private Integer cep;

    public Hemocentro() {
        
    }
    
    public Hemocentro(Integer id) {
        this.id = id;
    }

    public Hemocentro(String nome, String endereco, Integer cep) {
        this.nome = nome;
        this.endereco = endereco;
        this.cep = cep;
    }

    public Hemocentro(Integer id, String nome, String endereco, Integer cep) {
        this.id = id;
        this.nome = nome;
        this.endereco = endereco;
        this.cep = cep;
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

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Integer getCep() {
        return cep;
    }

    public void setCep(Integer cep) {
        this.cep = cep;
    }

    @Override
    public String toString() {
        return "Hemocentro{" + "id=" + id + ", nome=" + nome + ", endereco=" + endereco + ", cep=" + cep + '}';
    }   

}
