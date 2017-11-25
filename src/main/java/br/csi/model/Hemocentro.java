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
    private String cep;
    private String telefone;
    private String email;
    private String facebook;
    private String site;

    public Hemocentro() {
        
    }

    public Hemocentro(Integer id) {
        this.id = id;
    }

    public Hemocentro(Integer id, String nome, String endereco, String cep, String telefone, String email, String facebook, String site) {
        this.id = id;
        this.nome = nome;
        this.endereco = endereco;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.facebook = facebook;
        this.site = site;
    }

    public Hemocentro(String nome, String endereco, String cep, String telefone, String email, String facebook, String site) {
        this.nome = nome;
        this.endereco = endereco;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.facebook = facebook;
        this.site = site;
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

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    @Override
    public String toString() {
        return "Hemocentro{" + "id=" + id + ", nome=" + nome + ", endereco=" + endereco + ", cep=" + cep + ", telefone=" + telefone + ", email=" + email + ", facebook=" + facebook + ", site=" + site + '}';
    }
    
}
