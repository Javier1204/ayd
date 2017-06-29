<%-- 
    Document   : registrarHospedaje
    Created on : 27-may-2016, 17:01:45
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("Hola");
    String id_cliente = request.getParameter("id_cliente");
    String nombre_cliente = request.getParameter("nombre_cliente");
    String apellido_cliente = request.getParameter("apellido_cliente");
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
        System.out.println(nombre_cliente);
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