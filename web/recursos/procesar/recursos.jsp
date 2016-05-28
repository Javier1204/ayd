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
   Fachada fachada =  new Fachada();
   ArrayList<String> recurso = fachada.obtenerRecursosDisponibles(fecha_entrada, fecha_salida);
%>
<% if (recurso.size() > 0 && recurso!=null) { %>
<table id="tablaRecurso" class="table table-bordered table-striped">
    <tr>
        <td> Recurso </td>
        <td> <select id="recurso" name="recurso" class="form-control" onchange="javascript:validarRecurso()">
                <option> -Seleccione opción- </option>
            <% for(String rec: recurso){%>
            <option> <%= rec%> </option>
            <% } %>
            </select>
            
        </td>
    </tr>
</table>
<% }else{ %>
<table id="tablaRecurso" class="table table-bordered table-striped">
    <tr>
        <td> Recurso </td>
                <td><select id="recurso" name="recurso" class="form-control">
                        <option> -No hay recursos disponibles- </option>
            </select>
</td>
    </tr>
</table>
<% } %>
