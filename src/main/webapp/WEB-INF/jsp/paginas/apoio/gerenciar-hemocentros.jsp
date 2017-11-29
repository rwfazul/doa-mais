<%-- 
    Document   : gerenciar-hemocentros
    Created on : Nov 27, 2017, 10:10:11 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">    
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h2 class="titulo-destaque">Hemocentros cadastrados</h2>
            <p class="text-center">Gerencie os hemocentros parceiros do programa!</p>
            <div class="line"></div> 
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
        <div class="table-responsive">
            <table id="lista_hemocentros" class="table table-bordered table-striped table-hover" class="display">
                <thead>
                    <tr class="cabecalho">
                        <th>Hemocentro</th>
                        <th>Endereço</th>
                        <th>Telefone</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="h" items="${hemocentros}">
                        <tr>
                            <td>${h.nome}</td>
                            <td>${h.endereco}</td>
                            <td>${h.telefone}</td>
                            <td>
                                <a href="alterarHemocentro?id_hemocentro=${h.id}" class="btn btn-default"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i></a>
                                <a data-toggle="modal" data-target="#confirmacao" data-id="${h.id}" class="modal-confirmacao btn btn-danger"><i class=" glyphicon glyphicon-trash" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
                <p>Você tem certeza que deseja deletar o hemocentro?</p>
            </div>
            <div class="modal-footer">
                <form action="deletarHemocentro" method="get">
                    <input type="hidden" name="id_hemocentro" />
                    <button type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Deletar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true"></i> Manter</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#lista_hemocentros').DataTable( {
            "language": {
                "sEmptyTable": "Nenhum hemocentro cadastrado :(",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ hemocentros",
                "sInfoEmpty": "Mostrando 0 até 0 de 0 hemocentros",
                "sInfoFiltered": "(Filtrados de _MAX_ hemocentros)",
                "sInfoPostFix": "",
                "sInfoThousands": ".",
                "sLengthMenu": "_MENU_ resultados por página",
                "sLoadingRecords": "Carregando...",
                "sProcessing": "Processando...",
                "sZeroRecords": "Nenhum hemocentro encontrado",
                "sSearch": "Pesquisar",
                "oPaginate": {
                    "sNext": "Próximo",
                    "sPrevious": "Anterior",
                    "sFirst": "Primeiro",
                    "sLast": "Último"
                },
                "oAria": {
                    "sSortAscending": ": Ordenar colunas de forma ascendente",
                    "sSortDescending": ": Ordenar colunas de forma descendente"
                }
            }
        });
    });
</script>

<style>
    .cabecalho {
        background: #BF2025; 
        color: #FFF;
    }
    
    .table-hover tbody tr:hover {
        color: #BF2025;
    }
    
    table > thead > tr > th:last-child,
    table > tbody > tr > td:last-child {
        text-align: center;
    }
    
    table > tbody > tr > td:last-child a {
        margin: 3px;
    } 
    
    table > tbody > tr > td {
        vertical-align: middle !important;
    }
      
    #confirmacao .modal-dialog.modal-sm {
        padding-top: 15%;
    }

    #confirmacao .modal-footer {
        text-align: center;
    }

    #confirmacao .btn {
        width: 100px;
    }
    
    .pagination> .active > a {
        background-color: #BF2025; 
        border: 1px solid #BF2025;
    }
</style>


<script>
    $(function() {
        $("#lista_hemocentros").on("click", ".modal-confirmacao", function() {
           var id_hemocentro = $( this ).data("id");
           $("#confirmacao").find("input[name='id_hemocentro']").val(id_hemocentro);
        });
    });
</script>                            
    
    
