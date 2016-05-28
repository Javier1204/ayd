<%-- 
    Document   : cancelarReservaR
    Created on : 27-may-2016, 22:19:27
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String id_cliente = request.getParameter("id_cliente");
    String nombre_recurso = request.getParameter("nombre_recurso");
    String servicios = request.getParameter("servicios");
    String fecha_entrada = request.getParameter("fecha_entrada");
    String fecha_salida = request.getParameter("fecha_salida");
    
    Fachada fachada = new Fachada();
    boolean exito = false;
    
    exito = fachada.cancelarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida, servicios);
    
    if(exito){
    response.sendRedirect("../consultarReservas.jsp");
    }else{
        System.out.println("Error en la cancelacion");
    }





%>
