<%-- 
    Document   : procesarRegReserva
    Created on : May 26, 2016, 12:44:28 PM
    Author     : Mauricio
--%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Fachada fachada = new Fachada();
    String id_habitacion = request.getParameter("id_habitacion");
    String id_cliente = request.getParameter("id_cliente");
    String cantidad = request.getParameter("cantidad");
    out.println(cantidad + "lalala");
    String[] fecha_inicioA = request.getParameter("fecha_inicio").split("/");
    String[] fecha_salidaA = request.getParameter("fecha_salida").split("/");
    String nombre_cliente = request.getParameter("nombre_cliente");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String apellido_cliente = request.getParameter("apellido_cliente");
    String fecha_inicio = fecha_inicioA[2] + "-" + fecha_inicioA[0] + "-" + fecha_inicioA[1];
    String fecha_salida = fecha_salidaA[2] + "-" + fecha_salidaA[0] + "-" + fecha_salidaA[1];
    String answer = "";
    boolean exito = fachada.registrarReserva(id_habitacion, id_cliente, Integer.parseInt(cantidad), fecha_inicio, fecha_salida, nombre_cliente, telefono, email, apellido_cliente);

    if (!exito) {
        answer = "error";
    } else {
        response.sendRedirect("../verReservas.jsp");
    }
%>
<%=answer%>