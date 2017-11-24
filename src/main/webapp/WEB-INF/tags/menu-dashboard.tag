<%-- 
    Document   : menu
    Created on : Sep 17, 2017, 6:35:49 PM
    Author     : rhau
--%>

<%@tag description="cria navbar base" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="id" required="true" %>

<%-- any content can be specified here e.g.: --%>
<nav class="navbar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="minha-conta">
                <img src="img/logo-branco.png" alt="Doa Mais" class="navbar-img" width="98px">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="menu">
            <ul class="nav navbar-nav">
                <li id="home"><a href="minha-conta">Home</a></li>
                <li id="agendamentos"><a href="meus-agendamentos">Meus agendamentos</a></li>
                <li id="hemocentros"><a href="hemocentros-parceiros">Hemocentros</a></li> 
                <li id="eventos"><a href="eventos">Eventos</a></li> 
                <li id="alertas"><a href="alertas">Alertas</a></li> 
            </ul>
            <ul class="nav navbar-nav navbar-right">                
                <li class="dropdown" id="more">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li id="novoagendamento"><a href="novo-agendamento">Novo agendamento</a></li>
                        <li role="separator" class="divider"></li>
                        <li id="signout"><a href="sign-out" title="Sign out" class="text-center"><i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
                    </ul>
                </li>
                <li id="usrinfo">
                    <a href="meu-perfil">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                    </a>
                </li> 
            </ul>
        </div>  
    </div> <!-- ./container -->
</nav>

<script>
    document.getElementById("${id}").setAttribute("class", "active");
</script>