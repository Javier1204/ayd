<%-- 
    Document   : procesarSesion
    Created on : 02-abr-2016, 11:49:30
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("nombre_usuario");
    String password= request.getParameter("password");
    Fachada fachada = new Fachada();
    boolean exito = fachada.iniciarSesion(user, password);
    String mensaje="";
    if(exito){
        mensaje="S";
        session.setAttribute("usuario", user);;
        session.setAttribute("estadoSesion", true);

        session.setMaxInactiveInterval(1 * 60 * 60);
    }else{
        mensaje="Datos incorrectos";
    }
%>
<%= mensaje%>