<%-- 
    Document   : cadastro-doador
    Created on : Sep 19, 2017, 9:31:20 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow"> 
    <meta name="author" content="Rhauani Fazul">
    <title>Cadastro doador | Doa+</title>
    <link rel="stylesheet" href="recursos/_bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/menu-dashboard.css">
    <link rel="stylesheet" href="css/tela-cadastro.css">
    <link rel="stylesheet" href="recursos/_font-awesome/css/font-awesome.min.css">  
    <link rel="shortcut icon" href="img/icone.ico"/>
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
<header> 
    <nav class="navbar" role="navigation">
        <div class="container-fluid">
            <img src="img/logo-branco.png" alt="Doa Mais" class="navbar-img" width="98px">
        </div> <!-- ./container -->
    </nav>
</header>
    
<main>
    <div class="container-fluid">
         <div class="row">
            <div class="col-xs-12 col-md-6 col-md-offset-3">    
                <div class="form-cadastro">
                    <h1 class="text-center">Informações básicas > Doador
                        <a href="#" data-toggle="popover">
                            <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </a>
                    </h1>
                    <form action="cadastrarDoador" method="post" class="clearfix">
                        <hr/>
                        <input type="hidden" name="id" value="${id_usuario}">
                        <div class="form-group">
                            <label for="tipoSanguineo">Tipo sanguíneo<sup>*</sup></label>
                            <select id="tipoSanguineo" name="tipoSanguineo" class="form-control" required>
                                <option value="" selected disabled hidden>Selecione</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                            </select> 
                        </div>            
                        <div class="form-group">
                            <label for="opdefault">Você já doou sangue alguma vez?<sup>*</sup></label>
                            <label class="radio-inline" style="margin-left:7px;">
                                <input type="radio" name="optradio" value="op1">Sim
                            </label>
                            <label class="radio-inline">
                                <input id="opdefault" type="radio" name="optradio" value="op2">Não
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="ultimaDoacao">Quando foi sua última doação?</label>
                            <select id="ultimaDoacao" name="ultimaDoacao" class="form-control" required disabled>
                                <option value="" selected disabled hidden>Selecione</option>
                                <option value="1">Mais de um ano atrás</option>
                                <option value="2">Mais de seis meses atrás</option>
                                <option value="3">Mais de três meses atrás</option>
                                <option value="4">Mais de um mês atrás</option>
                                <option value="5">Menos de um mês atrás</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="peso">Peso (kg)<sup>*</sup></label>
                            <input type="number" id="peso" name="peso" maxlength="3" pattern="[0-9]*" placeholder="Informe seu peso" min="10" max="300" class="form-control" required />
                        </div>
                        <t:campo-form type="text" id="medicamentos" label="Você toma algum medicamento controlado?" placeholder="Cite de acordo com o que julgar necessário" />
                        <div class="form-group">
                            <label for="extra">Observações pessoais</label>
                            <textarea id="observacoes" name="observacoes" rows="2" class="form-control" placeholder="Escreva aqui particularidades que você ache relevante informar"></textarea>
                        </div>
                        <hr/>
                        <button type="submit" class="btn btn-submit pull-right">Finalizar cadastro</button>
                    </form>     
                </div> <!-- ./form-cadastro -->
            </div> <!-- ./col -->
        </div> <!-- ./row -->
    </div> <!-- ./container -->
</main>
                
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="recursos/_bootstrap/js/bootstrap.min.js"></script>
    <script src="recursos/_jquery-mask/src/jquery.mask.js"></script>
    <script>
        $(function() {
            $("#peso").mask("000");
            $("#medicamentos").prop( "required", false );
            $("#observacoes").prop( "required", false );
        });
    </script>
    <script>
        $(function() { 
            $("select").css("color", "#999");
            $("select").on("click change", function() {
                $( this ).css("color", "#555");
            });
        });
    </script>
    <script>
        $(function() {
            $('[data-toggle="popover"]').popover( {
                placement: "auto bottom",
                trigger: "hover",
                html: true,
                title: "Por que estes dados são necessários?",
                content: "Os dados referentes ao usuário e ao doador são necessários \n\
                para a realização de todas as <mark>ações básicas</mark> do sistema, como por exemplo o \n\
                agendamento das doações."
            });  
        });
    </script>
    <script>
        $(function() {
            $("input:radio[name='optradio']").on("change", function() {
                //muda cor do label do radio selecionado e seta label do outro pra cor default
                $( this ).parent().css("color", "#555");
                var anotherRadio = ( this.value === "op1" ) ? "op2" : "op1";
                $('input:radio[name="optradio"][value="' + anotherRadio + '"]').parent().css("color", "#72777C");

                //habilita select de acordo com a opcao (se op1 hablita, senao desabilita)
                var disableField = !( this.value === "op1" );
                var $field = $("select#ultimaDoacao");            
                $field.prop( "disabled", disableField );                        
            });      
        });
    </script>
</body>
</html>
