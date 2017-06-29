<%-- 
    Document   : modificarHospedaje
    Created on : 23-may-2016, 16:04:29
    Author     : Javier
--%>

<%@page import="dto.HospedajeDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("Hola");
    String id= request.getParameter("id");
    String id_cliente = request.getParameter("id_cliente");
    String cantidad = request.getParameter("cant");
    String fecha = request.getParameter("fecha");;
    String habitacion = request.getParameter("habitacion");
    String habAnt= request.getParameter("habAnt");
    System.out.println(habAnt);
    boolean exito=false;
    Fachada fachada = new Fachada();
    
    
    exito= fachada.modificarHospedaje(habitacion, cantidad, id_cliente, fecha,habAnt, id);
    
    String resp="";
    if(exito){
        resp="S";
    }else{
        resp="N";
    }
            
%>
<%= resp %>
