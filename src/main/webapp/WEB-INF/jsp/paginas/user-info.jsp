<%-- 
    Document   : user-info.jsp
    Created on : Sep 17, 2017, 3:39:08 PM
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
    <title>Visão geral da conta | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="css/user-info.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_jquery-mask/src/jquery.mask.js"></script>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
<header>   
    <!-- Navbar -->
    <t:menu-dashboard id="usrinfo"></t:menu-dashboard>
    <!-- /Navbar -->
</header>
    
<main>
    <div class="container-fluid">
        <div class="row content">
            <hr class="small visible-xs"/>
            <!-- MENU LATERAL -->
            <div class="col-xs-12 col-sm-3 sidenav">
                <ul class="nav nav-stacked">
                    <li class="active"><a href="#perfil" data-toggle="tab">Perfil</a></li>
                    <li><a href="#doador" data-toggle="tab">Doador</a></li>
                    <li><a href="#conta" data-toggle="tab">Conta</a></li>
                </ul>
            </div> <!-- ./sidenav -->
            <!-- ./MENU LATERAL -->
            <div class="col-xs-12 col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="perfil">
                        <!-- PERFIL -->
                        <c:choose>
                            <c:when test="${editarPerfil != null}">
                                <c:import url="apoio/edicaoperfil.jsp" />
                            </c:when>
                            <c:otherwise>
                                <c:import url="apoio/infoperfil.jsp" />
                            </c:otherwise>
                        </c:choose>             
                        <!-- ./PERFIL -->
                    </div>
                    <div class="tab-pane" id="doador">
                        <!-- DOADOR -->
                        <c:choose>
                            <c:when test="${editarDoador != null}">
                                <c:import url="apoio/edicaodoador.jsp" />
                            </c:when>
                            <c:otherwise>
                                <c:import url="apoio/infodoador.jsp" />
                            </c:otherwise>
                        </c:choose>         
                        <!-- ./DOADOR -->
                    </div>
                    <div class="tab-pane" id="conta">
                        <!-- CONTA -->
                        <c:choose>
                            <c:when test="${editarConta != null}">
                                <c:import url="apoio/edicaoconta.jsp" />
                            </c:when>
                            <c:otherwise>
                                <c:import url="apoio/infoconta.jsp" />
                            </c:otherwise>
                        </c:choose>
                        <!-- ./CONTA -->
                    </div>
                </div> <!-- ./tab-content -->
            </div> <!-- ./col -->
        </div> <!-- ./row -->
    </div> <!-- ./container-fluid -->
</main>
                        
<footer>
    <!-- Rodape -->
    <c:import url="apoio/rodape.jsp" />
    <!-- /Rodape -->      
</footer>
    
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <c:if test="${newTabActive != null}">
        <script>
            $(function() {
               $('[href="#${newTabActive}"]').click();
            });
        </script>
    </c:if> 
</body>
</html>