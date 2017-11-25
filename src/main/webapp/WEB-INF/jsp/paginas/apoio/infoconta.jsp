<%-- 
    Document   : infoconta
    Created on : Sep 18, 2017, 3:51:35 PM
    Author     : rhau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Conta pessoal</small></h4>
<hr>

<t:campo-editar label="E-mail" valor="${usuarioLogado.email}" target="editarUsuario"></t:campo-editar>
<div class="bloco-info">
    <span class="bloco-label">Senha</span>
    <a href="editarUsuario" class="btn btn-default">Editar</a> 
</div>
<div class="bloco-info">
    <span class="bloco-label"></span>
    <button type="button" data-toggle="modal" data-target="#confirmacao" class="btn btn-danger">Deletar conta</button> 
</div>


<div class="modal fade" id="confirmacao" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center">Confirmar exclusão</h4>
            </div>
            <form action="deletarUsuario" method="post">
                <div class="modal-body text-center">
                    <p>Cuidado: Esta ação não pode ser desfeita.</p>
                    <input type="password" name="confirmacao-senha" pattern=".{6,}" required title="6 characters minimum" class="form-control" placeholder="Digite sua senha"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Deletar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true"></i> Manter</button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:if test="${not empty msgErrorDelete}">
    <script>
        alert('${msgErrorDelete}');
    </script>
</c:if>   