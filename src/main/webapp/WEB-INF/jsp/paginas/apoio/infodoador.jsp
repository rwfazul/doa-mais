<%-- 
    Document   : infodoador
    Created on : Sep 18, 2017, 3:51:54 PM
    Author     : rhau
--%>

<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>  

<h4><small>Informa��es b�sicas > Doador</small></h4>
<hr>

<t:campo-editar label="Tipo sangu�neo" valor="${doadorInfo.tipoSanguineo}" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Peso" valor="${doadorInfo.peso}kg" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Voc� toma algum rem�dio controlado?" valor="${doadorInfo.medicamentos}" target="editarDoador"></t:campo-editar>
<t:campo-editar label="Observa��es pessoais" valor="${doadorInfo.observacoes}" target="editarDoador"></t:campo-editar>
