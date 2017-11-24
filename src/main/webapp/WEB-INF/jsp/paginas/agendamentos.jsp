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
    <title>Meus agendamentos| Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="recursos/_select2/select2.min.css">
    <link rel="stylesheet" href="recursos/_jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="css/agendamentos.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/novo-agendamento.css">
    <link rel="stylesheet" href="css/rodape-dashboard.css">
    <link rel="shortcut icon" href="img/icone.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- <style>
        @media(max-width: 480px) {
            td, th {
              display: block;
              width: 100%;
              text-align: center;
              border: none !important;
              border-top: 1px dotted #DDD !important;
            }

            tr {
                border: 1px solid #BF2025;
            }
        } 
    </style> -->
</head>
<body>

<header>   
    <!-- Navbar -->
    <t:menu-dashboard id="agendamentos"></t:menu-dashboard>
    <!-- /Navbar -->
</header>
    
<main>  
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Meus agendamentos
                    <a data-toggle="modal" data-target="#novo-agend" class="btn btn-custom">Novo
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                    </a>          
                </h1>
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
        <ul class="nav nav-tabs nav-pills nav-justified">
            <li class="active"><a href="#futuros" data-toggle="tab">Futuros</a></li>
            <li><a href="#passados" data-toggle="tab">Passados</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="futuros">
                <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th><i class="fa fa-hashtag" aria-hidden="true"></i></th>
                            <th>Hemocentro</th>
                            <th><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Data</th>
                            <th><i class="fa fa-clock-o" aria-hidden="true"></i> Horário</th>
                            <th><i class="fa fa-exclamation" aria-hidden="true"></i> Observações</th>
                            <th>-</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${agendamentosFuturos}">                             
                            <tr <c:if test="${a.evento.id != null}">class="success"</c:if>>
                                <td>${a.id}</td>
                                <td>${a.hemocentro.nome}</td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${a.data}" /></td>
                                <td>${a.faixaHorario}</td>
                                <td>${a.observacoes}</td>
                                <td><a class="modal-confirmacao" data-toggle="modal" data-target="#confirmacao" data-id="${a.id}"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                            </tr>
                        </c:forEach>                       
                    </tbody>
                </table>
                </div>
                <c:if test="${empty agendamentosFuturos}">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="alert alert-warning">
                                <h5 class="text-center"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Você ainda não possui agendamentos futuros :(</h5>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="tab-pane" id="passados">
                <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th><i class="fa fa-hashtag" aria-hidden="true"></i></th>
                            <th>Hemocentro</th>
                            <th><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Data</th>
                            <th><i class="fa fa-clock-o" aria-hidden="true"></i> Horário</th>
                            <th><i class="fa fa-exclamation" aria-hidden="true"></i> Observações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${agendamentosPassados}">                             
                            <tr <c:if test="${a.evento.id != null}">class="success"</c:if>>
                                <td>${a.id}1</td>
                                <td>${a.hemocentro.nome}</td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${a.data}" /></td>
                                <td>${a.faixaHorario}</td>
                                <td>${a.observacoes}</td>
                            </tr>
                        </c:forEach>         
                    </tbody>
                </table>            
                </div>
                <c:if test="${empty agendamentosPassados}">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="alert alert-warning">
                                <h5 class="text-center"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Você ainda não possui registro de agendamentos passados.</h5>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <hr/>
    </div>
    
    <div class="modal fade" id="confirmacao" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Confirmar exclusão</h4>
                </div>
                <div class="modal-body text-center">
                    <p id="msg-confirmacao"></p>
                </div>
                <div class="modal-footer">
                    <form action="deletarAgendamento" method="get">
                        <input type="hidden" id="id_agendamento_delete" name="id_agendamento" />
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
            $("#futuros").on("click", ".modal-confirmacao", function() {
               var id_agendamento = $( this ).data("id");
               $("#msg-confirmacao").text("Tem certeza que cancelar o agendamento #" + id_agendamento + "?");
               $("input[name='id_agendamento']").val(id_agendamento);
            });
        });
    </script>
    
</body>
</html>

    