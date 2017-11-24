<%-- 
    Document   : campo-form
    Created on : Sep 8, 2017, 5:40:53 PM
    Author     : rhau
--%>

<%@tag description="cria form-groups com inputs e seus respectivos labels" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="id" required="true" %>
<%@attribute name="type" required="true" %>
<%@attribute name="placeholder" required="true" %>
<%@attribute name="label" required="true" %>
<%@attribute name="value" required="false" %>

<%-- any content can be specified here e.g.: --%>
<div class="form-group">
    <label for="${id}">${label}</label>
    <input type="${type}" id="${id}" name="${id}" placeholder="${placeholder}" class="form-control" value="${value}" required/>
</div>