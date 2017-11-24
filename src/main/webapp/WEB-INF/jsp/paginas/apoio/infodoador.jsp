<%-- 
    Document   : infodoador
    Created on : Sep 18, 2017, 3:51:54 PM
    Author     : rhau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informações básicas > Doador</small></h4>
<hr>

<t:campo-editar label="Tipo sanguíneo" valor="${doadorInfo.tipoSanguineo}" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Peso" valor="${doadorInfo.peso}kg" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Você toma algum remédio controlado?" valor="${doadorInfo.medicamentos}" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Observações pessoais" valor="${doadorInfo.observacoes}" target="editarDoador"></t:campo-editar>
