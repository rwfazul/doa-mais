<%-- 
    Document   : edicaoconta
    Created on : Nov 22, 2017, 5:30:20 PM
    Author     : rhau
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Conta</small></h4>
<hr>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="form-login">
            <h1 class="form-titulo">Alterar sua conta</h1>
            <c:if test="${not empty msg}">
                <div class="alert alert-warning alert-dismissible fade in">  
                    <button class="close" data-dismiss="alert">&times;</button>
                    <p id="alert-msg" class="text-center"></p>
                </div> 
            </c:if>
            <form action="salvarAlteracoesUser" method="post">
                <t:campo-form type="email" id="email" label="Novo email" placeholder="nome@exemplo.com" value="${usuarioLogado.email}" />
                <t:campo-form type="password" id="senha" label="Nova senha" placeholder="Digite a senha" />
                <t:campo-form type="password" id="confirmacao" label="Confirme a senha" placeholder="Digite a senha novamente" />
                <div class="text-right">
                    <button type="submit" class="btn btn-submit">Alterar conta</button>
                    <a href="meu-perfil" class="btn btn-default">Cancelar</a>
                </div>
            </form>               
        </div>
    </div>
</div>
        
<style>
    .form-login {
        box-shadow: 0 1px 3px rgba(0,0,0,.13);
        border: 1px solid #E1E1E1;
        border-radius: 3%;
        box-sizing: border-box;
        padding: 5px 15px 30px;
        margin: 50px auto;
    }

    .form-login .form-titulo {
        font-size: 24px;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-login .form-group label {
        color: #72777C;
        font-weight: normal;
    }

    .form-login input {
        background-color: #FFF;
    }

    .form-login .btn-submit {
        background-color: #BF2025;
        color: #FFF;
    }       

    .form-login .btn-submit:hover,
    .form-login .btn-submit:focus {
        color: #333;
    }
</style>

<c:if test="${not empty msg}">
   <script>
        $(function() {
            var msg = ${msg};
            $('#alert-msg').text(msg.alerta);
        });
   </script>
   <c:remove var="msg"/> 
</c:if>         