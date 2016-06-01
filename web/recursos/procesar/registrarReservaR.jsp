<%-- 
    Document   : registrarReservaR
    Created on : 27-may-2016, 22:18:08
    Author     : FARID SANTIAGO
--%>

<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="dto.FacturaDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_cliente = request.getParameter("id_cliente");
    String nombre_cliente = request.getParameter("nombreCliente");
    String apellido_cliente = request.getParameter("apellidoCliente");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String procedencia = request.getParameter("procedencia");
    String nombre_recurso = request.getParameter("nombreRecurso");
    String fecha_entrada = request.getParameter("fechaEntrada");
    String fecha_salida = request.getParameter("fechaSalida");
    String servicio = request.getParameter("servicio");
    boolean exito = false;
    Fachada fachada = new Fachada();

    if (fachada.validarCliente(id_cliente)) {
        exito = fachada.registrarReservaRecurso(nombre_recurso, servicio, id_cliente, fecha_entrada, fecha_salida);
    } else {
        fachada.registrarCliente(id_cliente, nombre_cliente, apellido_cliente, telefono, email, procedencia);
        exito = fachada.registrarReservaRecurso(nombre_recurso, servicio, id_cliente, fecha_entrada, fecha_salida);
    }
    if (exito) {
        ReservaRecursoDTO resRec = fachada.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida);
        FacturaDTO factDTO = fachada.registrarFacturaRecurso(id_cliente, "" + resRec.getId());
%>
<a target="_blank" href="../public/jsp/factura.jsp?tipo_servicio=<%="Recurso"%>&id_servicio=<%= factDTO.getId_servicio()%>">Generar PDF</a>
<%
    }

    String resp = "";
    if (exito) {
        resp = "Si";
    } else {
        resp = "No";
    }


%>
<%= resp%>