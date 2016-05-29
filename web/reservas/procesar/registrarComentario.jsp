<%-- 
    Document   : registrarComentario
    Created on : 29-may-2016, 15:19:10
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nick= request.getParameter("txtNick");
    String comentario = request.getParameter("txtComentario");
    Fachada fachada = new Fachada();
    boolean exito = fachada.registrarComentario(nick, comentario);
    if(exito){
        response.sendRedirect("../opiniones.jsp");
    }
%>    