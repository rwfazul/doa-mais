<%-- 
    Document   : admin-dashboard
    Created on : Nov 27, 2017, 9:26:56 PM
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
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Eventos UFSM</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="recursos/_dataTables/datatables.min.css"/>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script src="recursos/_dataTables/datatables.min.js"></script>
    <script src="recursos/_jquery-mask/src/jquery.mask.js"></script>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- SIDEBAR -->
<nav id="sidebar">
    <div class="sidebar-header">
        <a class="img-ancora clearfix">
            <img src="img/logo.png" alt="Doa Mais" class="center-block img-logo" width="150px">
        </a>
            <h3>User: ${adminLogado.login}</h3>
    </div>
    <ul class="list-unstyled components">
            <li id="painel" class="active">
                <a href="admin-dashboard"><i class="glyphicon glyphicon-home"></i> Painel</a>
            </li>            
            <li id="novo">
                <a href="novo-hemocentro"><i class="glyphicon glyphicon-plus"></i> Novo</a>
            </li>      
    </ul>
</nav>
<!-- /SIDEBAR -->

<!-- CONTEUDO -->
<div id="content">
<!-- TOOOGLE -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" id="sidebarCollapse" class="btn btn-default navbar-btn" style="color: #BF2025;">
                <i class="glyphicon glyphicon-align-left"></i>
                <span class="sr-only">Toggle Sidebar</span>
            </button>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="#">Painel do administrador DOA+</a></li>
        </ul>
    </div>
</nav> 
<!-- ./TOOGLE -->

    <c:import url="apoio/${page}"></c:import>

    <%-- <c:choose>
        <c:when test="${page eq 'gerenciarHemocentros'}">
            <c:import url="apoio/gerenciar-hemocentros.jsp"></c:import>
        </c:when>
        <c:otherwise>
            <c:import url="apoio/novo-hemocentro.jsp"></c:import>
        </c:otherwise>
    </c:choose> --%>
    
</div>
<!-- /CONTEUDO -->    

    <script>
        $(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    
    <c:if test="${not empty menuAtivo}">
        <script>
            $(function() {
                $("#sidebar").find(".active").removeClass("active");
                $("#sidebar li[id='${menuAtivo}']").addClass("active");
            });
        </script>
        <c:remove var="menuAtivo" />
    </c:if> 

</body>
</html>