<%-- 
    Document   : alertas
    Created on : Nov 23, 2017, 1:05:38 AM
    Author     : rhau
--%>
<%-- 
    Document   : agendamentos
    Created on : Sep 24, 2017, 8:21:00 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow"> 
    <meta name="author" content="Rhauani Fazul">
    <title>Alertas | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/alertas.css">
    <link rel="stylesheet" href="recursos/_select2/select2.min.css">
    <link rel="stylesheet" href="recursos/_jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<header>   
    <!-- Navbar -->
    <t:menu-dashboard id="alertas"></t:menu-dashboard>
    <!-- /Navbar -->
</header>
    
<main>  
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Últimos alertas</h1>
                <hr/>     
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="novo-agend" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <c:import url="apoio/form-agendamento.jsp" />
                </div>
            </div>
        </div>
    </div>  
    
    <div class="container">
    <div class="row">
    <div class="col-md-8 col-md-offset-2">
        <h4 class="text-center">Veja os hemocentros que precisam de seu tipo sanguíneo com urgência!</h4>
        <div id="alertas-secao">
            <c:forEach var="a" items="${alertasAtivosUser}">
                <div class ="bloco-alerta">
                    <span class="icone">
                        <i class="fa fa-heartbeat fa-4x"></i>
                    </span>
                    <div class="hemocentro-info clearfix">
                        <p>${a.hemocentro.nome}</p>
                        <p>Fone: ${a.hemocentro.telefone} 
                            <a class="modal-info btn btn-help pull-right" data-toggle="modal" data-target="#situacao" data-tipo="${a.tipoSanguineo}" data-obj="${a.objetivo}" data-inf="${a.informacoes}">Situação</a>
                        </p>
                        <p>Alerta emitido em: <fmt:formatDate pattern="dd/MM/yyyy" value="${a.data}" /></p>
                    </div> 
                </div>                
            </c:forEach>
            <c:if test="${empty alertasAtivosUser}">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="alert alert-warning">
                            <h5 class="text-center"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Não há alertas de urgência para seu tipo sanguíneo.</h5>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    </div><hr/>
    </div>
                
    <div class="modal fade" id="situacao" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Informações</h4>
                </div>
                <div class="modal-body">
                    <p id="modal-tipo"></p>
                    <p id="modal-obj"></p>
                    <p id="modal-info"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>
                
</main>

<footer>
    <!-- Rodape -->
    <c:import url="apoio/rodape.jsp" />
    <!-- /Rodape -->      
</footer>    
        
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script src="recursos/_select2/select2.min.js"></script>
    <script src="recursos/_select2/pt-BR.js"></script>
    <script src="recursos/_jquery-ui/jquery-ui.min.js"></script>
    <script>
        $(function() {
            $(".select-search").select2( {            
                allowClear: true,
                placeholder: "Selecione um hemocentro",
                language: "pt-BR"
            });
        });
    </script>
    <script>
        $(function() {
            $("#data").datepicker( { 
                minDate: 0,
                dateFormat: "dd/mm/yy"
            });
        });
    </script>
    <script>
        $(function() {
            $("#alertas-secao").on("click", ".modal-info", function() {
                var tipoSanguineo = $( this ).data("tipo");
                var objetivo = $( this ).data("obj");
                var informacoes = $( this ).data("inf");
                if (informacoes === '') informacoes = 'N/A';
                var $modal = $("#situacao");
                console.log($modal);
                $modal.find("#modal-tipo").html("Tipo sanguíneo: <span style='color: #BF2025'>" + tipoSanguineo + "</span>");
                $modal.find("#modal-obj").html("Objetivo de doações: <span style='color: #007FFF'>" + objetivo + "</span>");
                $modal.find("#modal-info").text("Considerações extras: " + informacoes);
            });
        });

    </script>
    
</body>
</html>

    