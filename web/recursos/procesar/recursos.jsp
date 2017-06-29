<%-- 
    Document   : recursos
    Created on : 27-may-2016, 22:18:23
    Author     : FARID SANTIAGO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String fecha_entrada = request.getParameter("fechaEntrada");
    String fecha_salida = request.getParameter("fechaSalida");
    Fachada fachada = new Fachada();
    ArrayList<String> recurso = fachada.obtenerRecursosDisponibles(fecha_entrada, fecha_salida);
%>
<% if (recurso.size() > 0 && recurso != null) { %>
<div class="input-field col s6">
    <select id="servicio" class="validate" name="servicio" onchange="javascript:validarRecurso()">
        <option value="">--Seleccione una opción--</option>
        <% for (String rec : recurso) {%>
        <option> <%= rec%> </option>
        <% } %>
    </select>
    <label for="servicio">Servicio</label>
</div>
<% } else { %>
<div class="input-field col s6">
    <select id="servicio" class="validate" name="servicio" onchange="javascript:validarRecurso()">
        <option value="" disabled selected>--Seleccione una opción--</option>
    </select>
    <label for="servicio">Servicio</label>
</div>
<% }%>
