<%-- 
    Document   : procesarConsulta
    Created on : 15-oct-2016, 23:45:05
    Author     : FARID SANTIAGO
--%>

<%@page import="dto.EmpleadoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String tipo = request.getParameter("tipo");
    String dato = request.getParameter("dato");

    Fachada fachada = new Fachada();
    ArrayList<EmpleadoDTO> cto = fachada.consultarEmpleado(tipo, dato);
    if (!cto.isEmpty()) {
%>
<table class="striped highlight" bgcolor="white">
    <thead>
        <tr>
            <th data-field="cedula">Cedula</th>
            <th data-field="nombre">Nombre</th>
            <th data-field="apellido">Apellido</th>
            <th data-field="direccion">Direccion</th>
            <th data-field="celular">Celular</th>
            <th data-field="email">E-mail</th>
            <th data-field="experiencia">Años Experiencia</th>
            <th data-field="cargo">Cargo</th>
            <th data-field="editar">Editar</th>
        </tr>
    </thead>
    <%
        for (EmpleadoDTO e : cto) {
    %>
    <tr>
        <th data-field="cedula"><%=e.getCc()%></th>
        <th data-field="nombre"><%=e.getNombres()%></th>
        <th data-field="apellido"><%=e.getApellidos()%></th>
        <th data-field="direccion"><%=e.getDireccion()%></th>
        <th data-field="celular"><%=e.getCelular()%></th>
        <th data-field="email"><%=e.getEmail()%></th>
        <th data-field="experiencia"><%=e.getAnio_experiencia()%></th>
        <th data-field="cargo"><%=e.getCargo()%></th>
        <th data-field="editar"><a class="btn waves-effect waves-light blue" href="modificarEmpleado.jsp?cc=<%=e.getCc()%>">Editar</a></th>
    </tr>

    <% }%>
</table>
<%

} else {%>
<table class="striped highlight" bgcolor="white">
    <thead>
        <tr>
            <th data-field="nombre">Cedula</th>
            <th data-field="apellido">Nombre</th>
            <th data-field="cedula">Apellido</th>
            <th data-field="direccion">Direccion</th>
            <th data-field="celular">Celular</th>
            <th data-field="email">E-mail</th>
            <th data-field="experiencia">Años Experiencia</th>
            <th data-field="cargo">Cargo</th>
            <th data-field="editar">Editar</th>
        </tr>
    </thead>
    <tr>
        <th></th>
        <th ></th>
        <th ></th>
        <th >No se encontrarón resultados</th>
        <th ></th>
        <th ></th>
        <th ></th>
        <th ></th>
        <th ></th>
    </tr>
</table>
<%}%>
