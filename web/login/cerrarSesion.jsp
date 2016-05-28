<%-- 
    Document   : cerrarSesion
    Created on : 02-abr-2016, 11:49:11
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("../index/index.jsp"); 
%>