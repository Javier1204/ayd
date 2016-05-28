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
    if (cliente != null) {
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
            <td> <a class="btn btn-info" href="modificarCliente.jsp?id_cliente=<%=cliente.getId_cliente()%>"> Modificar</a></td>
            <td> <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"> Eliminar</button> </td>
        </tr>   
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <legend>¿Está seguro de eliminar?</legend>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1">
                                <a type="button" href="procesar/eliminar.jsp?id_cliente=<%=cliente.getId_cliente()%>" name="si" id="si" class="btn btn-adn"> Sí</a>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1">
                                <a type="button" name="no" id="no" data-dismiss="modal" class="btn btn-adn"> No</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</tbody>
</table>
<% } else { %>
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
</table> <%}%>