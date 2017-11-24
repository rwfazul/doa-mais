<%-- 
    Document   : infoconta
    Created on : Sep 18, 2017, 3:51:35 PM
    Author     : rhau
--%>

<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Conta pessoal</small></h4>
<hr>

<t:campo-editar label="E-mail" valor="${usuarioLogado.email}" target="editarUsuario"></t:campo-editar>

<div class="bloco-info">
    <span class="bloco-label">Senha</span>
    <a href="editarUsuario" class="btn btn-default">Editar</a> 
</div>