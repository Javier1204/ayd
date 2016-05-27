<%-- 
    Document   : registroHospedaje
    Created on : 20-may-2016, 14:45:43
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("Hola");
    String id_cliente = request.getParameter("id_cliente");
    String nombre_cliente = request.getParameter("nombreCliente");
    String apellido_cliente = request.getParameter("apellido");
    String telefono = request.getParameter("telefono");
    String email= request.getParameter("email");
    String procedencia = request.getParameter("procedencia");
    String cantidad = request.getParameter("cant");
    String fecha = request.getParameter("fecha");;
    String habitacion = request.getParameter("habitacion");
    boolean exito=false;
    Fachada fachada = new Fachada();
    
    if(fachada.validarCliente(id_cliente)){
        exito =fachada.registrarHospedaje(habitacion, cantidad, id_cliente, fecha);
    }else{
        fachada.registrarCliente(id_cliente, nombre_cliente, apellido_cliente, telefono, email, procedencia);
        exito= fachada.registrarHospedaje(habitacion, cantidad, id_cliente, fecha);
    }
    String resp="";
    if(exito){
        resp="S";
    }else{
        resp="N";
    }
            
%>
<%= resp %>