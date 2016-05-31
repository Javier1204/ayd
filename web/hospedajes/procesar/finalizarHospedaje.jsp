<%-- 
    Document   : finalizarHospedaje
    Created on : 31-may-2016, 17:08:46
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id_cliente=request.getParameter("id_cliente");
    String id_hab = request.getParameter("id_habitacion");
    String fecha_e = request.getParameter("fecha_e");
    String fecha_s = request.getParameter("fecha_s");
    Fachada fachada = new Fachada();
    boolean exito = fachada.finalziarHospedaje(id_cliente, id_hab, fecha_s, fecha_e);
    response.sendRedirect("../consultarHospedajesActivos.jsp");
%>