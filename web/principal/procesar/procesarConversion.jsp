<%-- 
    Document   : procesarConversion
    Created on : May 31, 2016, 1:25:57 PM
    Author     : Mauricio
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Fachada facade = new Fachada();
    String id_habitacion = request.getParameter("id_habitacion");
    String id_cliente = request.getParameter("id_cliente");
    int cantidad = Integer.parseInt(request.getParameter("cantPersonas"));
    String fecha_inicio = request.getParameter("fecha_inicio");
    String fecha_salida = request.getParameter("fecha_salida");
    String nombre_cliente = request.getParameter("nombre_cliente");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String apellido_cliente = request.getParameter("apellido_cliente");
    String id_reserva = request.getParameter("id_reserva");
    String procedencia = "Colombia";
    
    boolean exito = facade.convertirReservaHospedaje(id_habitacion, id_cliente, cantidad, fecha_inicio, fecha_salida, nombre_cliente, telefono, email, apellido_cliente, id_reserva);
    
    if(exito){
        response.sendRedirect("../verReservas.jsp");
    }else{
        response.sendRedirect("../verReservas.jsp");
    }
    
%>