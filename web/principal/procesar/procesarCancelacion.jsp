<%-- 
    Document   : procesarCancelacion
    Created on : May 31, 2016, 11:43:00 AM
    Author     : Mauricio
--%>

<%@page import="dto.ReservaDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Fachada facade = new Fachada();
    String id_reserva = request.getParameter("id_reserva");
    boolean exito = facade.cancelarReserva(id_reserva);
    if (exito) {
        response.sendRedirect("../verReservas.jsp");
    } else {
        response.sendRedirect("../verReservas.jsp");
    }
%>