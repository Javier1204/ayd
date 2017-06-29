<%-- 
    Document   : consultarReservaR
    Created on : 27-may-2016, 22:19:13
    Author     : FARID SANTIAGO
--%>
<%@page import="facade.Fachada" %>
<%@page import="dto.ReservaRecursoDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_cliente = request.getParameter("idCliente");
    String nombre_recurso = request.getParameter("nombreRecurso");
    String fecha_inicio = request.getParameter("fechaInicio");
    String fecha_fin = request.getParameter("fechaFin");
    Fachada fachada = new Fachada();
    ReservaRecursoDTO dto = fachada.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_inicio, fecha_fin);

    if (dto != null) {
%>   <table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Recurso </th>
            <th> Cliente a cargo </th>
            <th> Servicios Asistenciales </th>
            <th> Fecha de entrada </th>
            <th> Fecha de salida </th>
            <th> Acción </th>
            <th> Acción </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th><%= dto.getNombreRecurso()%></th>
            <th><%= dto.getId_cliente()%></th>
            <th><%= dto.getServicios()%></th>
            <th><%= dto.getFecha_inicio()%></th>
            <th><%= dto.getFecha_final()%></th>
            <th><a class="btn btn-dropbox" href="modificarReserva.jsp?id_cliente=<%=dto.getId_cliente()%>&nombre_recurso=<%=dto.getNombreRecurso()%>&fecha_inicio=<%=dto.getFecha_inicio()%>&fecha_fin=<%=dto.getFecha_final()%>">Actualizar</a></th>
            <td> <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"> Cancelar</button> </td>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <legend>¿Está seguro de cancelar reserva?</legend>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1">
                                <a type="button" name="si" id="si" href="procesar/cancelarReservaR.jsp?nombre_recurso=<%=dto.getNombreRecurso()%>&id_cliente=<%=dto.getId_cliente()%>&servicios=<%=dto.getServicios()%>&fecha_entrada=<%=dto.getFecha_inicio()%>&fecha_salida=<%=dto.getFecha_final()%>" class="btn btn-adn"> Sí</a>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1">
                                <button type="button" name="no" id="no" data-dismiss="modal" class="btn btn-adn"> No</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</tr>
</tbody>
</table>
<% } else { %>
<table id="tablaAdmin" class="table table-bordered table-striped">
    <thead style="background-color: #2c3b41; color: #fff">
        <tr>
            <th> Recurso </th>
            <th> Cliente a cargo </th>
            <th> Servicios Asistenciales </th>
            <th> Fecha de entrada </th>
            <th> Fecha de salida </th>
            <th> Acción </th>
            <th> Acción </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th> </th>
            <th> </th>
            <th> </th>
            <th>No se encontro resultados de consulta</th>
            <th> </th>
            <th> </th>
            <th> </th>
        </tr>
    </tbody>
</table>
<% }%>
