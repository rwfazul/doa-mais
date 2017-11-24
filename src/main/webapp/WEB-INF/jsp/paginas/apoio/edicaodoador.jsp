<%-- 
    Document   : edicaodoador
    Created on : Nov 22, 2017, 6:48:42 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Doador</small></h4>
<hr>
<div class="row">
<div class="col-md-8 col-md-offset-2">
<div class="form-doador">
    
<h1 class="form-titulo">Alterar suas informações</h1>
<c:if test="${not empty msg}">
    <div class="alert alert-warning alert-dismissible fade in">  
        <button class="close" data-dismiss="alert">&times;</button>
        <p id="alert-msg" class="text-center">${msg}</p>

    </div> 
    <c:remove var="msg"/> 
</c:if>
<form action="salvarAlteracoesDoador" method="post">
    <div class="form-group">
        <label for="tipoSanguineo">Tipo sanguíneo<sup>*</sup></label>
        <select id="tipoSanguineo" name="tipoSanguineo" class="form-control" required>
            <option value="" selected disabled hidden>Selecione</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
        </select> 
    </div>            
    <div class="form-group">
        <label for="peso">Peso (kg)<sup>*</sup></label>
        <input type="number" id="peso" name="peso" maxlength="3" pattern="[0-9]*" placeholder="Informe seu peso" min="10" max="300" class="form-control" value="${doadorInfo.peso}" required />
    </div>
    <t:campo-form type="text" id="medicamentos" label="Você toma algum medicamento controlado?" placeholder="Cite de acordo com o que julgar necessário" value="${doadorInfo.medicamentos}" />
    <div class="form-group">
        <label for="extra">Observações pessoais</label>
        <textarea id="observacoes" name="observacoes" rows="2" class="form-control" placeholder="Escreva aqui particularidades que você ache relevante informar">${doadorInfo.observacoes}</textarea>
    </div>
    <div class="text-right">
        <button type="submit" class="btn btn-submit">Alterar informações</button>
        <a href="meu-perfil" class="btn btn-default">Cancelar</a>
    </div>
</form>     

</div>
</div>
</div>
   
<style>
    .form-doador {
        box-shadow: 0 1px 3px rgba(0,0,0,.13);
        border: 1px solid #E1E1E1;
        border-radius: 3%;
        box-sizing: border-box;
        padding: 5px 15px 30px;
        margin: 50px auto;
    }

    .form-doador .form-titulo {
        font-size: 24px;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-doador .form-group label {
        color: #72777C;
        font-weight: normal;
    }

    .form-doador input {
        background-color: #FFF;
    }

    .form-doador .btn-submit {
        background-color: #BF2025;
        color: #FFF;
    }       

    .form-doador .btn-submit:hover,
    .form-doador .btn-submit:focus {
        color: #333;
    }
</style>

<script>
    $(function() {
        $('#tipoSanguineo').val($.trim('${doadorInfo.tipoSanguineo}')); // remover espacos em branco se houver
        $("#peso").mask("000");
        $("#medicamentos").prop( "required", false );
        $("#observacoes").prop( "required", false );
    });
</script>