<%-- 
    Document   : cadastro-perfil
    Created on : Sep 19, 2017, 9:41:10 AM
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
    <meta name="robots" content="noindex, nofollow"> 
    <meta name="author" content="Rhauani Fazul">
    <title>Cadastro perfil | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/tela-cadastro.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="shortcut icon" href="img/icone.ico"/>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
<header> 
    <nav class="navbar" role="navigation">
        <div class="container-fluid">
            <img src="img/logo-branco.png" alt="Doa Mais" class="navbar-img" width="98px">
        </div> <!-- ./container -->
    </nav>
</header>
    
<main>
    <div class="container-fluid">
         <div class="row">
            <div class="col-xs-12 col-md-6 col-md-offset-3">    
                <div class="form-cadastro">
                    <h1 class="text-center">Informações básicas > Perfil
                        <a href="#" data-toggle="popover">
                            <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </a>
                    </h1>
                    <form action="cadastrarPerfil" method="post" class="clearfix">
                        <hr/>
                        <c:if test="${not empty msgPerfil}">
                            <div class="alert alert-warning alert-dismissible fade in">  
                                <button class="close" data-dismiss="alert">&times;</button>
                                <p>${msgPerfil}</p>
                            </div> 
                            <c:remove var="msgPerfil"/> 
                        </c:if>
                        <input type="hidden" name="id" value="${id_usuario}">
                        <t:campo-form type="text" id="nome" label="Nome<sup>*</sup>" placeholder="Nome completo" />
                        <t:campo-form type="text" id="cpf" label="CPF<sup>*</sup>" placeholder="Digite o CPF" />
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
                        <t:campo-form type="text" id="celular" label="Celular<sup>*</sup>" placeholder="Digite o celular" />
                        <t:campo-form type="text" id="cep" label="CEP<sup>*</sup>" placeholder="Digite o CEP" />  
                        <hr/>
                        <button type="submit" class="btn btn-submit pull-right">Próximo 
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                        </button>
                    </form>     
                </div> <!-- ./form-cadastro -->
            </div> <!-- ./col -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->
</main>
                
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script src="recursos/_jquery-mask/src/jquery.mask.js"></script>
    <script>
        $(function() {
            $("#cpf").mask("000.000.000-00");
            $("#dia").mask("00");
            $("#ano").mask("0000");
            $("#celular").mask("(00) 0 0000-0000");
            $("#cep").mask("00000-000");
        });
    </script>
    <script>
        $(function() { 
            $("select").css("color", "#999");
            $("select").change(function() {
                $( this ).css("color", "#555");
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $('[data-toggle="popover"]').popover( {
                placement: "auto bottom",
                trigger: "hover",
                html: true,
                title: "Por que estes dados são necessários?",
                content: "Os dados referentes ao usuário e ao doador são necessários \n\
                para a realização de todas as <mark>ações básicas</mark> do sistema, como por exemplo o \n\
                agendamento das doações."
            });  
        });
    </script>
    
</body>
</html>
