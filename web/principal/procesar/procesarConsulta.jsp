<%-- 
    Document   : procesarConsulta
    Created on : May 31, 2016, 11:19:39 AM
    Author     : Mauricio
--%>
<%@page import="dto.ReservaDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_cliente = request.getParameter("id_cliente");
    Fachada fachada = new Fachada();
    ReservaDTO dto = fachada.consultarReserva(id_cliente);
    if (dto != null) {
%>  <table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> ID Reserva </th>
            <th> ID Cliente </th>
            <th> Fecha entrada </th>
            <th> Fecha salida </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> <%= dto.getId_reserva() %></td>
            <td> <%= dto.getId_cliente() %> </td>
            <td> <%= dto.getFecha_inicio() %> </td>
            <td> <%= dto.getFecha_salida()%></td>
        </tr>

    </tbody>
</table> 
<% } else {%>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> ID Reserva </th>
            <th> ID Cliente </th>
            <th> Fecha entrada </th>
            <th> Fecha salida </th>
            <th> Acción </th>
            <th> Acción </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> </td>
            <td> </td>
            <td>No se hallaron resultados </td>
            <td> </td>          
        </tr>

    </tbody>
</table> 
<% }%>
