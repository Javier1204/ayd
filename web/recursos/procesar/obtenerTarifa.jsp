<%-- 
    Document   : obtenerTarifa
    Created on : 27-may-2016, 22:18:40
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tarifa = request.getParameter("tarifa");
    Fachada fachada = new Fachada();
    String tar = fachada.obtenerTarifaRecurso(tarifa);
%>
<% if (tar != null) {%>
<div class="input-field col s6">
    <input id="txtTarifa" value="<%= tar%>" readonly="true" name="txtTarifa" class="validate" />
    <label class="active" for="txtTarifa">Tarifa</label>
</div>
<% } else { %>
<table id="tablaTarifa" class="table table-bordered table-striped">
    <tr>
        <td> Tarifa de Recurso</td>
        <td>
            <input type="text" name="txtTarifa" id="txtTarifa" class="form-control" readonly="true"/>
        </td>
    </tr>
</table>
<% }%>
