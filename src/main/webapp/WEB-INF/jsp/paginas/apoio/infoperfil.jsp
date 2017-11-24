<%-- 
    Document   : infoperfil
    Created on : Sep 18, 2017, 3:52:10 PM
    Author     : rhau
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Perfil</small></h4>
<hr>

<t:campo-editar label="Nome" valor="${doadorInfo.nome}" target="editarPerfil"></t:campo-editar>
<t:campo-editar label="CPF" valor="${doadorInfo.cpf}" target="editarPerfil"></t:campo-editar>
<div class="bloco-info">
    <span class="bloco-label">Data de nascimento</span>
    <span class="bloco-valor"><fmt:formatDate pattern="dd/MM/yyyy" value="${doadorInfo.dataNascimento}" /></span>
    <a href="editarPerfil" class="btn btn-link">Editar</a> 
</div>
<c:choose>
    <c:when test="${doadorInfo.sexo == 'm'}">
        <t:campo-editar label="Sexo" valor="Masculino" target="editarPerfil"></t:campo-editar>    
    </c:when>
    <c:otherwise>
        <t:campo-editar label="Sexo" valor="Feminino" target="editarPerfil"></t:campo-editar>    
    </c:otherwise>
</c:choose>
<t:campo-editar label="Celular" valor="${doadorInfo.celular}" target="editarPerfil"></t:campo-editar>
<t:campo-editar label="CEP" valor="${doadorInfo.cep}" target="editarPerfil"></t:campo-editar>

