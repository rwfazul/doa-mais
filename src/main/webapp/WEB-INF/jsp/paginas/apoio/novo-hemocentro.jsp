<%-- 
    Document   : novo-hemocentro
    Created on : Nov 27, 2017, 10:10:16 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">    
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <c:choose>
                <c:when test="${empty hemocentroUpdate}">
                    <h2 class="titulo-destaque">Inserir hemocentro</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="titulo-destaque">Alterar hemocentro</h2>                   
                </c:otherwise> 
            </c:choose>
        </div>
    </div>
</div>

<div class="container-fluid">
<div class="row">        
<div class="col-md-8 col-md-offset-2">
    
    <div class="panel panel-default">
        <div class="panel-heading">Sobre o hemocentro</div>
        <div class="panel-body">
    <c:choose>
        <c:when test="${empty hemocentroUpdate}">
            <form action="inserirHemocentro" method="post">
        </c:when>
        <c:otherwise>
            <form action="salvarAlteracoesUpdate" method="post">
            <input type="hidden" name="id" value="${hemocentroUpdate.id}" />
        </c:otherwise> 
    </c:choose>                
                <t:campo-form type="text" id="nome" value="${hemocentroUpdate.nome}" label="Nome" placeholder="Digite o nome do hemocentro"></t:campo-form>
                <t:campo-form type="text" id="endereco" value="${hemocentroUpdate.endereco}" label="Endereço" placeholder="Digite o endereço"></t:campo-form>
                <t:campo-form type="text" id="cep" value="${hemocentroUpdate.cep}" label="CEP" placeholder="Digite o CEP"></t:campo-form>
                <t:campo-form type="text" id="telefone" value="${hemocentroUpdate.telefone}" label="Telefone" placeholder="Digite o telefone"></t:campo-form>
                <t:campo-form type="email" id="email" value="${hemocentroUpdate.email}" label="Email" placeholder="nome@examplo.com"></t:campo-form>
                <t:campo-form type="url" id="facebook" value="${hemocentroUpdate.facebook}" label="Página do Facebook" placeholder="Página do facebook (se houver)"></t:campo-form>
                <t:campo-form type="url" id="site" value="${hemocentroUpdate.site}" label="Site do hemocentro" placeholder="Site do hemocentro (se houver)"></t:campo-form>
                <button type="submit" class="btn btn-lg btn-default btn-custom pull-right">Finalizar</button>
            </form>
        </div>
    </div>                     
                        
</div> <!-- ./col -->
</div> <!-- ./row -->
</div> <!-- ./container-fluid -->

<style>
    .panel-default {
        border-color: #BF2025;
    }
    
    .panel-default>.panel-heading {
        color: #FFF;
        background-color: #BF2025;
        border-color: #BF2025;
    }
    
    .btn-custom {
        background-color: #BF2025;
        color: #FFF;
        width: 130px;
    }
    
    .btn-custom:hover,
    .btn-custom:focus {
        background-color: #BF2025;  
        color: #333;    
    }
</style>

<script>
    $(function() {
        $("#cep").mask("000000-000");
        $("#telefone").mask("(00) 0000-0000");
        $("#facebook").prop("required", false);
        $("#site").prop("required", false);
    });
</script>