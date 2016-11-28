<%-- 
    Document   : cargarDescripcion
    Created on : May 26, 2016, 4:35:48 PM
    Author     : Mauricio
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
<% }%>
