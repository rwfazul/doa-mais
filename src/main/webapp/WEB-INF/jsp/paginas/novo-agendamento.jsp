<%-- 
    Document   : novo-agendamento
    Created on : Sep 24, 2017, 9:14:03 PM
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
    <title>Novo agendamento | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="recursos/_select2/select2.min.css">
    <link rel="stylesheet" href="recursos/_jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="css/novo-agendamento.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            background-color: #F1F1F1;
        }
        
        .form-agendamento {
            background-color: #FFF;
            padding: 10px 25px;
            border: 1px solid #E1E1E1;       
            border-radius: 7px;
            margin: 27px auto;
        }
    </style>
</head>
<body>

<header>   
    <!-- Navbar -->
    <t:menu-dashboard id="more"></t:menu-dashboard>
    <!-- /Navbar -->
</header>
    
<main>
    <div class="container-fluid">
         <div class="row">
            <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">    
                <c:import url="apoio/form-agendamento.jsp" />
            </div> <!-- ./col -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->
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
    <script src="recursos/_jquery-mask/src/jquery.mask.js"></script>

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
            $("#data").mask("00/00/0000");
        });
    </script>
</body>
</html>

