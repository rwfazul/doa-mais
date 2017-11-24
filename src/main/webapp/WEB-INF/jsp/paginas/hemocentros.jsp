<%-- 
    Document   : hemocentros-teste
    Created on : Sep 21, 2017, 12:13:39 AM
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
    <title>Hemocentros | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="css/hemocentros.css">
    <link rel="stylesheet" href="css/user-info.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
<header>   
    <!-- Navbar -->
    <t:menu-dashboard id="hemocentros"></t:menu-dashboard>
    <!-- /Navbar -->
</header>

    <!-- testa para ver se os dados iniciais do doador ja foram preenchidos para liberar acesso -->
    <c:if test="false">
        <c:import url="modalCadastro.jsp"/>
    </c:if>
    
<main>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Hemocentros parceiros</h1>
                <hr/>     
            </div>
        </div>
    </div>

    <div class="container-fluid">
      <div class="row"> 
            <div id="hemocentros-secao">          
                <c:forEach var="h" items="${hemocentros}">                             
                    <div class ="item-superior">
                        <h2>${h.nome}</h2>
                        <span class="icone">
                            <i class="fa fa-tint fa-4x"></i>
                        </span>
                        <div class="hemocentro-info">
                            <p>Endereço: ${h.endereco}</p>
                            <p>CEP: ${h.cep}</p>                          
                            <p>Fone: </p>
                            <div class="hemocentro-social">
                                <a href=""><i class="fa fa-envelope"></i></a>
                                <a href=""><i class="fa fa-home"></i></a>
                                <a href=""><i class="fa fa-facebook"></i></a>
                            </div>
                        </div> 
                    </div>
                </c:forEach>
            <hr/>
            </div> <!-- ./hemocentros -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->

</main>
    
<footer>
    <!-- Rodape -->
    <c:import url="apoio/rodape.jsp" />
    <!-- /Rodape -->      
</footer>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>

