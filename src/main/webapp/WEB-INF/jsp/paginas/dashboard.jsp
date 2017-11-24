    <%-- 
    Document   : cadastro
    Created on : Sep 17, 2017, 12:48:51 PM
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
    <title>Início | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="recursos/_select2/select2.min.css">
    <link rel="stylesheet" href="recursos/_jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/novo-agendamento.css">
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
    <t:menu-dashboard id="home"></t:menu-dashboard>
    <!-- /Navbar -->
</header>

    <!-- testa para ver se os dados iniciais do doador ja foram preenchidos para liberar acesso -->
    <c:if test="false">
        <c:import url="apoio/modalCadastro.jsp"/>
    </c:if>
    
<main>    
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Olá, doador!</h1>
                <hr/>     
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-8 col-md-offset-2">
            </div>
        </div>
        <div class="row stats-session">
            <div class="col-md-10 col-md-offset-1"> 
                <h4 class="text-center"><i class="fa fa-heartbeat fa-4x icone-stats"></i></h4>
                <h4 class="text-center text-uppercase">Confira as estatísticas das doações</h4>
            <c:forEach var="e" items="${estatisticas}" varStatus="i">
                <style> #tipo${i.index}:before { content: ""; height: ${e.valor}%; } </style>
                <div class="col-sm-6 col-md-3"><div id="tipo${i.index}" class="blood-stats">${e.chave} (${e.valor}%)</div></div>
            </c:forEach>       
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12 text-center">
                <button class="novo" data-toggle="modal" data-target="#novo-agend">
                    <i class="fa fa-calendar-check-o"></i><br/>
                    Novo agendamento
                </button>
            </div>
        </div><br/>
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
</main>
    
<footer id="rodape">
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
            
            $("#data").datepicker( { 
                minDate: 0,
                dateFormat: "dd/mm/yy"
            });
        });
    </script>
    <script>
        $(function(){
            if ($(document.body).height() < $(window).height()) {
                $('#rodape').attr('style', 'position:fixed!important;bottom:0px;width:100%;');
            }
        });  
    </script>
</body>
</html>
