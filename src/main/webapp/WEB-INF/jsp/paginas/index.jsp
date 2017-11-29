<%-- 
    Document   : index
    Created on : Sep 15, 2017, 11:33:42 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Doe sangue, doe vida! Doa+ :)">
    <meta name="keywords" content="sangue, doacao, agendamento, hemocentro, blood, donator">
    <meta name="author" content="Rhauani Fazul">
    <title>Doa + | Doe sangue, doe vida!</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="fundo">
    
<header>   
    <!-- Navbar -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="Doa Mais" class="navbar-img" width="98px">
                </a>
            </div>
            <div class="collapse navbar-collapse" id="menu">
                <form action="logarUsuario" method="post" class="navbar-form navbar-right" role="form">
                    <div class="input-group">
                        <label for="email" class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </label>
                        <input id="email-login" type="email" name="email" placeholder="Seu e-mail" class="form-control" required>                                        
                    </div>
                    <div class="input-group form-group">
                        <label for="password" class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </label>
                        <input id="senha-login" type="password" name="senha" placeholder="Sua senha" class="form-control" required>                                        
                    </div>  
                    <button type="submit" class="btn navbar-btn">Entrar
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                    </button>                             
                </form>
            </div>  
        </div> <!-- ./container-fluid -->
    </nav>
    <!-- /Navbar -->
</header>
    
<main>    
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-7 col-lg-7 text-center">
                <h1 class="titulo">Doe sangue, <br/> doe vida!</h1>
                <p class="descricao">
                    O objetivo desse sistema é incentivar a <span class="descricao-destaque">
                    doação de sangue</span> e auxiliar os hemocentros interessados no gerenciamento
                    de doações.
                    Aqui o <span class="descricao-destaque">doador</span> pode realizar agendamentos,
                    se comunicar com os hemocentros parceiros e ficar por dentro de <span class="descricao-destaque">
                    eventos</span> de doação de sangue de sua região. 
                    <span class="descricao-destaque" style="white-space:nowrap;">Doa+ :)</span>
                </p>
                <a href="dm-admin" class="btn btn-hemocentro">Painel do hemocentro <i class="fa fa-sign-in" aria-hidden="true"></i></a>
            </div>
            <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-5 col-md-offset-0 col-lg-4 col-lg-offset-1">
                <div class="form-login">
                    <h1 class="form-titulo">Criar uma nova conta</h1>
                    <form action="cadastrarUsuario" method="post">
                        <t:campo-form type="email" id="email" label="Email" placeholder="nome@exemplo.com" />
                        <t:campo-form type="password" id="senha" label="Senha" placeholder="Digite a senha" />
                        <t:campo-form type="password" id="confirmacao" label="Confirme a senha" placeholder="Digite a senha novamente" />
                        <button type="submit" class="btn btn-lg btn-submit">Cadastrar</button>
                    </form>               
                </div>
            </div> <!-- col -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->
</main>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <c:if test="${not empty msg}">
        <style>     
            .tooltip > .tooltip-inner {
                background-color: #FFF;
                color: #BF2025;
                border: 1px solid #555;
                padding: 3px;
                font-size: 15px;              
            }
        </style>
        <script>
            $(function() {
                var msg = ${msg};
                $('#' + msg.id).tooltip( {
                   placement: "auto bottom",
                   title: msg.alerta
                }).tooltip("show");
            });
        </script>
        <c:remove var="msg"/> 
    </c:if>         

</body>
</html>
