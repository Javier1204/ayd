<%-- 
    Document   : procesarConsulta
    Created on : 22-may-2016, 16:21:13
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.ClienteDTO"%>
<%@page import="facade.Fachada"%>
<%
    String id_cliente = request.getParameter("id_cliente");
    Fachada fachada = new Fachada();
    ClienteDTO cliente = fachada.consultarCliente(id_cliente);
    if(cliente!=null){
%>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Documento </th>
            <th> Nombre </th>
            <th> Teléfono </th>
            <th> Procedencia </th>
            <th> e-mail </th>
            <th> Acción </th>
            <th> Acción </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> <%= cliente.getId_cliente()%>  </td>
            <td> <%= cliente.getNombre_cliente() + " " + cliente.getApellido()%> </td>
            <td> <%= cliente.getTelefono()%> </td>
            <td> <%= cliente.getProcedencia()%> </td>
            <td> <%= cliente.getEmail()%> </td>
            <td> <a href="#"> Modificar</a></td>
            <td> <a href="#"> Eliminar</a> </td>
        </tr>   

    </tbody>
</table>
<% } else{ %>
    <table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Documento </th>
            <th> Nombre </th>
            <th> Teléfono </th>
            <th> Procedencia </th>
            <th> e-mail </th>
            <th> Acción </th>
            <th> Acción </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> </td>
            <td> </td>
            <td> </td>
            <td>No se hallaron resultados</td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>   
    </tbody>
</table> <%} %>