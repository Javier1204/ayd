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
%>
<% if (habitaciones.size() > 0) {%>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <tr>
        <td> Habitación</td>
        <td> <select id="habitacion" name="habitacion" class="form-control">
                <% for(String hab : habitaciones){%>
                <option> <%= hab %></option>
                <% } %>
            </select> </td>
    </tr>
    <tr> </tr>
</table>
<% } %>
