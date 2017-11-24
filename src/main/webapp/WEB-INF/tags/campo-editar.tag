<%-- 
    Document   : campo-editar
    Created on : Sep 20, 2017, 3:51:33 PM
    Author     : rhau
--%>

<%@tag description="cria bloco de edicao dos inputs e labels do formulario" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="label" required="true" %>
<%@attribute name="valor" required="true" %>
<%@attribute name="target" required="true" %>

<%-- any content can be specified here e.g.: --%>
<div class="bloco-info">
    <span class="bloco-label">${label}</span>
    <span class="bloco-valor">${valor}</span>
    <a href="${target}" class="btn btn-link">Editar</a> 
</div>
