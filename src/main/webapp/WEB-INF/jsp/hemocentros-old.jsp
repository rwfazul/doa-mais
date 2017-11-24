<%-- 
    Document   : hemocentros
    Created on : Sep 20, 2017, 6:29:26 PM
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
    <link rel="stylesheet" href="css/user-info.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="shortcut icon" href="img/icone.ico"/>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style>
            main h1 {
                font-family: Roboto;
                margin-top: 35px;
                color: #333;
                text-transform: uppercase;
            }
            
            main hr {
                border-top: 2px solid #BF2025;
                width: 75%;
            }
            
            #hemocentros-secao {
                text-align: center;
                margin-bottom: 30px;
            }
            
            #hemocentros-secao .item-hemocentro {
                max-width: 360px; 
                border-radius: 5px;
                border: 1px solid #E3E3E3;
                margin: 5px; 
                padding: 0 10px;
                vertical-align: middle;
                display: inline-flex;
                align-items: center;
            }
                

            #hemocentros-secao .item-superior .icone {
                float: left;
                margin-right: 25px;
                margin-top: 20px;
                color: #BF2025;
            }
            
            #hemocentros-secao .item-superior .icone:hover,
            #hemocentros-secao .item-superior .icone:focus {
                opacity: .8;
            }
            
            #hemocentros-secao .item-superior h2 { 
                font-size: 20px;
                text-align: center;
                color: #BF2025;
            }
            
            .hemocentro-info {
                overflow: hidden;
            }
            
            .hemocentro-info  p {
                color: #333;
                text-align: left;
                font-size: 17px;
                margin: 0;
            }
            
            .hemocentro-info .hemocentro-social {
                margin: 8px 7px;
                text-align: right;
            }
            
            .hemocentro-info .hemocentro-social a {
                margin: 3px;
            }

            .hemocentro-info .hemocentro-social .fa { 
                font-size: 25px; 
                color: #333;
            }
            
            .hemocentro-info .hemocentro-social .fa:hover,
            .hemocentro-info .hemocentro-social .fa:focus {
                color: #BF2025;
            }
    </style>
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
                
                <%
                    for(int i = 0; i < 25; i++) {
                %> 
                    <div class="item-hemocentro">
                        <div id="int-1" class ="item-superior">
                            <h2>Hemocentro Regional de Santa Maria</h2>
                            <span class="icone">
                                <i class="fa fa-tint fa-4x"></i>
                            </span>
                            <div class="hemocentro-info">
                                <p>Alameda Santiago do Chile Nº 35, Bairro: Centro<p/>
                                <p>Cidade, estado</p>
                                <p>Fone: (00) 0000-0000</p>
                                <div class="hemocentro-social">
                                    <a href=""><i class="fa fa-envelope"></i></a>
                                    <a href=""><i class="fa fa-home"></i></a>
                                    <a href=""><i class="fa fa-facebook"></i></a>
                                </div>
                            </div> 
                        </div>
                    </div>
                <%    
                    }
                %>
                
            <hr/>
            </div> <!-- ./hemocentros -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->

</main>
    
<footer>
    <!-- Rodape -->
    <c:import url="rodape.jsp" />
    <!-- /Rodape -->      
</footer>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script>
        (function($, window) {
            var $ls;
            function autoheight() {
                var max = 0;
                $ls.each(function() {
                    $t = $(this);
                    $t.css('height','');
                    max = Math.max(max, $t.height());
                });
                $ls.height(max);
            }
            $(function() {
                $ls = $('.item-hemocentro'); // the inline-block selector
                autoheight(); // first time
                $ls.on('load', autoheight); // when images in content finish loading
                $(window).resize(autoheight); // when the window size changes
            });
        })(jQuery, window);
    </script> 
</body>
</html>

