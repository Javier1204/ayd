<%-- 
    Document   : procesarConsulta
    Created on : 23-may-2016, 10:12:12
    Author     : Javier
--%>

<%@page import="dto.HospedajeDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_cliente = request.getParameter("id_cliente");
    String f_salida = request.getParameter("f_salida");
    String f_entrada = request.getParameter("f_entrada");
    Fachada fachada = new Fachada();
    HospedajeDTO dto = fachada.consultarHospedaje(id_cliente, f_salida, f_entrada);
    if (dto != null) {
%>  <table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Habitación </th>
            <th> Cliente a cargo </th>
            <th> Fecha entrada </th>
            <th> Fecha salida </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> <%= dto.getId_habitacion()%></td>
            <td> <%= dto.getId_cliente()%> </td>
            <td> <%= dto.getFecha_entrada()%> </td>
            <td> <%= dto.getFecha_salida()%></td>
        </tr>

    </tbody>
</table> 
<% } else {%>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Habitación </th>
            <th> Cliente a cargo </th>
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