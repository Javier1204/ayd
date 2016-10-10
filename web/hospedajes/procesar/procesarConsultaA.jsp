<%-- 
    Document   : procesarConsultaA
    Created on : 23-may-2016, 14:02:34
    Author     : Javier
--%>

<%@page import="dto.HospedajeDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id_cliente = request.getParameter("id_cliente");
    String habitacion = request.getParameter("habitacion");
    System.out.println(habitacion);
    Fachada fachada = new Fachada();
    HospedajeDTO dto = fachada.consultarHospedajeActivo(id_cliente, habitacion);
    if (dto != null) {
%>   <table class="striped highlight" bgcolor="white">
    <thead>
        <tr class="grey darken-2 white-text">
            <th data-field="id">Id</th>
            <th data-field="tipo">Habitación</th>
            <th data-field="tarifa">Cliente</th>
            <th data-field="descripcion">Fecha entrada</th>
            <th data-field="imagen">Fecha salida</th>
            <th data-field="editar">Acción</th>
            <th data-field="editar">Acción</th>
        </tr>
    </thead>
    <tr>
        <td> <%=dto.getId()%></td>
        <td> <%= dto.getId_habitacion()%></td>
        <td> <%= dto.getId_cliente()%> </td>
        <td> <%= dto.getFecha_entrada()%> </td>
        <td> <%= dto.getFecha_salida()%></td>
        <td> <a  href="modificarHospedaje.jsp?id_habitacion=<%=dto.getId_habitacion()%>&id_cliente=<%=dto.getId_cliente()%>">Modificar </a></td>
        <td> <a  href="procesar/finalizarHospedaje.jsp?id=<%=dto.getId()%>&id_habitacion=<%=dto.getId_habitacion()%>&id_cliente=<%=dto.getId_cliente()%>&fecha_s=<%= dto.getFecha_salida()%>&fecha_e=<%= dto.getFecha_entrada()%>">Finalizar </a></td>
    </tr>
</table>
<% } else {%>
<table class="striped highlight" bgcolor="white">
            <thead>
                <tr class="grey darken-2 white-text">
                    <th data-field="id">Id</th>
                    <th data-field="tipo">Habitación</th>
                    <th data-field="tarifa">Cliente</th>
                    <th data-field="descripcion">Fecha entrada</th>
                    <th data-field="imagen">Fecha salida</th>
                    <th data-field="editar">Acción</th>
                    <th data-field="editar">Acción</th>
                </tr>
            </thead>
            <tr>
                <td colspan="7"> <center>No se hallaron resultados</center></td>
            </tr>
        </table>
<% }%>