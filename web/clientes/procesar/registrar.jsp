<%-- 
    Document   : registrar
    Created on : 21-may-2016, 11:16:00
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
    boolean exito=false;
    Fachada fachada = new Fachada();
    exito = fachada.registrarCliente(id_cliente, nombre_cliente, apellido_cliente, telefono, email, procedencia);
    String resp="";
    if(exito){
        resp="S";
    }else{
        resp="N";
    }
            
%>
<%= resp %>