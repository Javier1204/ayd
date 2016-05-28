<%-- 
    Document   : eliminar
    Created on : 26-may-2016, 18:28:02
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id_cliente= request.getParameter("id_cliente");
    System.out.print(id_cliente);
    Fachada fachada = new Fachada();
    boolean exito = fachada.eliminarCliente(id_cliente);
    if(exito){
        response.sendRedirect("../consultarCliente.jsp");
    }
%>