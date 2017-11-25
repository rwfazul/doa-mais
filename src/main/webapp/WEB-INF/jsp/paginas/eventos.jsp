<%-- 
    Document   : eventos
    Created on : Sep 24, 2017, 7:56:30 PM
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
    <title>Eventos | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="css/eventos.css">
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
    <t:menu-dashboard id="eventos"></t:menu-dashboard>
    <!-- /Navbar -->
</header>
    
<main>    <style>main{min-height:539px;}</style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Eventos de doação</h1>
                <hr/>     
            </div>
        </div>
    </div>
    
    <div class="container">
        <ul class="nav nav-tabs nav-pills nav-justified">
            <li class="active"><a href="#futuros" data-toggle="tab">Próximos</a></li>
            <li><a href="#passados" data-toggle="tab">Eventos que participei</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="futuros">          
                <div class="list-group">
                    <c:if test="${not empty msg}">
                        <div class="alert alert-warning alert-dismissible fade in">  
                            <button class="close" data-dismiss="alert">&times;</button>
                            <p id="alert-msg" class="text-center">${msg}</p>

                        </div> 
                        <c:remove var="msg"/> 
                    </c:if>
                    <c:forEach var="e" items="${eventosAgendados}">                             
                        <a class="list-group-item list-group-item-success modal-delete" data-toggle="modal" data-target="#confirmacao" data-id="${e.id}">
                            <h4 class="list-group-item-heading">
                                <i class="fa fa-calendar" aria-hidden="true"></i> 
                                ${e.nome} <span class="badge" title="Agendamentos no evento">${e.qtdAgendamentos}</span>
                            </h4>
                            <p class="list-group-item-text">
                                ${e.descricao}
                            </p>
                            <ul class="list-group-item-text informacoes">
                                <li><strong>Organizado por:</strong> ${e.hemocentro.nome}</li>
                                <li><strong>Onde? </strong> ${e.local}</li>
                                <li><strong>Quando? </strong> <fmt:formatDate pattern="dd/MM/yyyy" value="${e.data}" />, ${e.horario}</li>
                            </ul>
                        </a>
                    </c:forEach>
                    <c:forEach var="e" items="${eventosFuturos}">                             
                        <a class="list-group-item modal-new" data-toggle="modal" data-target="#agendamento" data-id="${e.id}">
                            <h4 class="list-group-item-heading">
                                <i class="fa fa-calendar" aria-hidden="true"></i> 
                                ${e.nome} <span class="badge" title="Agendamentos no evento">${e.qtdAgendamentos}</span>
                            </h4>
                            <p class="list-group-item-text">
                                ${e.descricao}
                            </p>
                            <ul class="list-group-item-text informacoes">
                                <li><strong>Organizado por:</strong> ${e.hemocentro.nome}</li>
                                <li><strong>Onde? </strong> ${e.local}</li>
                                <li><strong>Quando? </strong> <fmt:formatDate pattern="dd/MM/yyyy" value="${e.data}" />, ${e.horario}</li>
                            </ul>
                        </a>
                    </c:forEach>  
                    <c:if test="${(empty eventosAgendados) && (empty eventosFuturos)}">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="alert alert-warning">
                                    <h5 class="text-center"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Não há eventos futuros :(</h5>
                                </div>
                            </div>
                        </div>
                    </c:if>             
                </div>           
            </div>
            <div class="tab-pane" id="passados">
                <div class="list-group">
                    <c:forEach var="e" items="${eventosParticipados}">                             
                        <div class="list-group-item">
                            <h4 class="list-group-item-heading">
                                <i class="fa fa-calendar-check-o" aria-hidden="true"></i> 
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${e.data}" /> - ${e.nome} <span class="badge" title="Agendamentos no evento">${e.qtdAgendamentos}</span>
                            </h4>
                            <p class="list-group-item-text">
                                ${e.descricao}<br/>
                                O evento foi organizado por: <strong>${e.hemocentro.nome}</strong>
                            </p>
                        </div>
                    </c:forEach>    
                    <c:if test="${empty eventosParticipados}">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="alert alert-warning">
                                    <h5 class="text-center"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Você ainda não participou de nenhum evento :(</h5>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>               
            </div>
        </div>
        <hr/>
    </div>
     
    <div class="modal fade" id="agendamento" tabindex="-1" role="dialog"> 
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Realizar agendamento</h4>
                </div>
                <div class="modal-body text-center">
                    <p>Você deseja realizar um agendamento nesse evento?</p>
                </div>
                <div class="modal-footer">
                    <form action="novoAgendamentoEvento" method="get">
                        <input type="hidden" name="id_evento" />
                        <button type="submit" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i> Agendar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>  
    
    <div class="modal fade" id="confirmacao" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Confirmar exclusão</h4>
                </div>
                <div class="modal-body text-center">
                    <p>Você tem certeza que deseja cancelar o agendamento no evento?</p>
                </div>
                <div class="modal-footer">
                    <form action="deletarAgendamentoEvento" method="get">
                        <input type="hidden" id="id_agendamento_delete" name="id_evento" />     
                        <button type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Deletar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true"></i> Manter</button>
                    </form>
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
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function() {
            $("#futuros").on("click", ".modal-new", function() {
                var id_evento = $( this ).data("id");
                $("#agendamento input[name='id_evento']").val(id_evento);
            });
            
            $("#futuros").on("click", ".modal-delete", function() {
                var id_evento = $( this ).data("id");
                $("#confirmacao input[name='id_evento']").val(id_evento);
            });
        });
    </script>
    
</body>
</html>
