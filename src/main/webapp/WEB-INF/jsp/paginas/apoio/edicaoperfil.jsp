<%-- 
    Document   : edicaoperfil
    Created on : Nov 22, 2017, 6:48:48 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h4><small>Informações básicas > Perfil</small></h4>
<hr>
<div class="row">
<div class="col-md-8 col-md-offset-2">
<div class="form-perfil">
    
<h1 class="form-titulo">Alterar suas informações</h1>
<c:if test="${not empty msg}">
    <div class="alert alert-warning alert-dismissible fade in">  
        <button class="close" data-dismiss="alert">&times;</button>
        <p id="alert-msg" class="text-center">${msg}</p>

    </div> 
    <c:remove var="msg"/> 
</c:if>
<form action="salvarAlteracoesPerfil" method="post">
    <input type="hidden" name="id" value="${id_usuario}">
    <t:campo-form type="text" id="nome" label="Nome<sup>*</sup>" placeholder="Nome completo" value="${doadorInfo.nome}" />
    <t:campo-form type="text" id="cpf" label="CPF<sup>*</sup>" placeholder="Digite o CPF" value="${doadorInfo.cpf}" />
    <div class="form-group">
        <label for="dia">Data de nascimento<sup>*</sup></label>
        <div class="row">
            <div class="col-xs-3" style="padding-right:0;">
                <input type="number" id="dia" name="dia" maxlength="2" pattern="[0-9]*" placeholder="Dia" min="1" max="31" class="form-control" required />
            </div>
            <div class="col-xs-6">
                <select id="mes" name="mes" class="form-control" required>
                    <option value="" selected disabled>Mês</option>
                    <option value="1">Janeiro</option>
                    <option value="2">Fevereiro</option>
                    <option value="3">Março</option>
                    <option value="4">Abril</option>
                    <option value="5">Maio</option>
                    <option value="6">Junho</option>
                    <option value="7">Julho</option>
                    <option value="8">Agosto</option>
                    <option value="9">Setembro</option>
                    <option value="10">Outubro</option>
                    <option value="11">Novembro</option>
                    <option value="12">Dezembro</option>
                </select> 
            </div>
            <div class="col-xs-3" style="padding-left:0;">
                <input type="number" id="ano" name="ano" maxlength="4" pattern="[0-9]*" placeholder="Ano" min="1900" class="form-control" required />
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="sexo">Sexo<sup>*</sup></label>
        <select id="sexo" name="sexo" class="form-control" required>
            <option value="" selected disabled hidden>Selecione</option>
            <option value="m">Masculino</option>
            <option value="f">Feminino</option>
        </select> 
    </div>   
    <t:campo-form type="text" id="celular" label="Celular<sup>*</sup>" placeholder="Digite o celular" value="${doadorInfo.celular}" />
    <t:campo-form type="text" id="cep" label="CEP<sup>*</sup>" placeholder="Digite o CEP" value="${doadorInfo.cep}" />  
    <div class="text-right">
        <button type="submit" class="btn btn-submit">Alterar informações</button>
        <a href="meu-perfil" class="btn btn-default">Cancelar</a>
    </div>
</form>     
    
</div>
</div>
</div>
    
<style>
    .form-perfil {
        box-shadow: 0 1px 3px rgba(0,0,0,.13);
        border: 1px solid #E1E1E1;
        border-radius: 3%;
        box-sizing: border-box;
        padding: 5px 15px 30px;
        margin: 50px auto;
    }

    .form-perfil .form-titulo {
        font-size: 24px;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-perfil .form-group label {
        color: #72777C;
        font-weight: normal;
    }

    .form-perfil input {
        background-color: #FFF;
    }

    .form-perfil .btn-submit {
        background-color: #BF2025;
        color: #FFF;
    }       

    .form-perfil .btn-submit:hover,
    .form-perfil .btn-submit:focus {
        color: #333;
    }
</style>

<script>
    $(function() {
        $("#cpf").mask("000.000.000-00");
        $("#dia").mask("00");
        $("#ano").mask("0000");
        $("#celular").mask("(00) 0 0000-0000");
        $("#cep").mask("00000-000");
        $("#sexo").val("${doadorInfo.sexo}"); 
        $("#dia").val(<fmt:formatDate pattern="dd" value="${doadorInfo.dataNascimento}" />);
        $("#mes").val(<fmt:formatDate pattern="MM" value="${doadorInfo.dataNascimento}" />);
        $("#ano").val(<fmt:formatDate pattern="yyyy" value="${doadorInfo.dataNascimento}" />);
    });
</script>