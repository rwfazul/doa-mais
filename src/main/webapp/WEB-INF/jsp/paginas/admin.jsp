<%-- 
    Document   : index
    Created on : Sep 9, 2017, 6:17:59 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
        <style>
            body {
                background: #BF2025;
                background: linear-gradient(to left, rgba(255,0,0,0), #BF2025);
                background-repeat: repeat;
                background-attachment: fixed;
            }
            
            .form-login {
                background: #FFF;
                box-shadow: 0 1px 3px rgba(0,0,0,.13);
                border: 1px solid #E1E1E1;
                box-sizing: border-box;
                border-radius: 7px;
                padding: 5px 15px 30px;
                margin-top: 30%;
                vertical-align: middle;
            }
            
            .form-login .form-group label {
                color: #72777C;
                font-weight: normal;
            }
            
            .form-login .btn-submit {
                margin-top: 15px;
                width: 100%;
                background-color: #BF2025;
                background: linear-gradient(to bottom right, #E85664, #F18D96, #BF2025, #F18D96);
                color: white;
            }
        </style>
    </head>
    <body>

        <div class="container" style="margin-top: 80px;">
            <div class="row">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                    
                    <div class="form-login">
                        <img src="img/logo.png" alt="doa mais" class="center-block img-responsive logo-form" height="50%" width="50%"/>               
                        <c:if test="${not empty msg}">
                            <div class="alert alert-danger alert-dismissible fade in" style="margin: 8px auto;">  
                                <button class="close" data-dismiss="alert">&times;</button>
                                <p class="text-center">${msg}</p>
                            </div> 
                            <c:remove var="msg"/> 
                        </c:if>
                        <form action="admin-login" method="post">
                            <t:campo-form type="text" id="login" label="Login" placeholder="Digite o login" />
                            <t:campo-form type="password" id="senha" label="Senha" placeholder="Digite a senha" />
                            <button type="submit" class="btn btn-default btn-submit">Fazer login</button>
                        </form>               
                    </div>     
                </div> <!-- col -->
            </div> <!-- ./row -->
        </div> <!-- ./container -->
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
        
    </body>
</html>
