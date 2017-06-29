<%--
    Document   : habitaciones
    Created on : 20-may-2016, 0:09:24
    Author     : Javier
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cantPersonas = request.getParameter("cant");
    String fecha_salida = request.getParameter("fecha");
    Fachada fachada = new Fachada();
    ArrayList<String> habitaciones = fachada.obtenerHabitacionesDisponibles(Integer.parseInt(cantPersonas), fecha_salida);
    System.out.println("SS");
%>
<% if (habitaciones.size() > 0 && habitaciones != null) {%>
<div class="input-field col s6">
    <select id="habitacion" class="validate" name="habitacion" onchange="javascript:cargarDescripcion(this)">
        <option value="" disabled selected>--Seleccione una opción--</option>
        <% for (String hab : habitaciones) { %>
        <option value="<%= hab%>"> <%= hab%> </option>
        <% } %>
    </select>
    <label for="tipo">Tipo habitacion</label>
</div>
<% } else { %>
 <div class="input-field col s6">
    <select id="habitacion" class="validate" name="habitacion" onchange="javascript:cargarDescripcion(this)">
        <option value="" disabled selected>Sin habitaciones disponibles</option>
    </select>
    <label for="tipo">Tipo habitacion</label>
</div>
<% }%>