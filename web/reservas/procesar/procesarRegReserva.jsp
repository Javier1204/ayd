<%-- 
    Document   : procesarRegReserva
    Created on : May 26, 2016, 12:44:28 PM
    Author     : Mauricio
--%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    out.println("llegó acá");
    Fachada fachada = new Fachada();
    String id_habitacion = request.getParameter("id_habitacion");
    String id_cliente = request.getParameter("id_cliente");
    int cantidad = Integer.parseInt(request.getParameter("cantidad").trim());
    String fecha_inicio = request.getParameter("fecha_inicio");
    String fecha_salida = request.getParameter("fecha_salida");
    String nombre_cliente = request.getParameter("nombre_cliente");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String apellido_cliente = request.getParameter("apellido");
    String procedencia_cliente = request.getParameter("procedencia_cliente");
    out.println("recibió los datos");
    String answer = "";
    boolean exito = fachada.registrarReserva(id_habitacion, id_cliente, cantidad, fecha_inicio, fecha_salida, nombre_cliente, telefono, email, apellido_cliente, procedencia_cliente);
    if(!exito){
        answer = "Ingrese Datos válidos";
    }else{
        answer = "Reserva exitosa!";
    }
%>
<%=answer%>
