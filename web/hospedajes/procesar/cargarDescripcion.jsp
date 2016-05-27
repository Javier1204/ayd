<%-- 
    Document   : cargarDescripcion
    Created on : 23-may-2016, 20:58:58
    Author     : Javier
--%>

<%@page import="dto.HabitacionDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("habitacion");
    System.out.println(id);
    Fachada fachada = new Fachada();
    HabitacionDTO h = fachada.consultarHabitacion(id);
    if (h != null) {
%>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <tr>
        <td> Descripción habitación</td>
        <td> <textarea readonly="true" name="txtDescripcion" id="txtDescripcion" class="form-control">
Habitación: <%= h.getDescripcion()%>
Tarifa: <%= h.getTarifa()%>
            </textarea>
        </td>
    </tr>
</table>
<% } %>