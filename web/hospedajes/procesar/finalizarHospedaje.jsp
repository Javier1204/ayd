<%-- 
    Document   : finalizarHospedaje
    Created on : 31-may-2016, 17:08:46
    Author     : Javier
--%>

<%@page import="java.util.Calendar"%>
<%@page import="dto.FacturaDTO"%>
<%@page import="dto.HospedajeDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id_cliente = request.getParameter("id_cliente");
    String id_hab = request.getParameter("id_habitacion");
    String fecha_e = request.getParameter("fecha_e");
    String fecha_s = request.getParameter("fecha_s");
    Fachada fachada = new Fachada();
    boolean exito = fachada.finalziarHospedaje(id_cliente, id_hab, fecha_s, fecha_e);
    if (exito) {
  
        Calendar c1 = Calendar.getInstance();
        String fecha = c1.get(Calendar.YEAR) + "-" + (c1.get(Calendar.MONTH) + 1) + "-" + c1.get(Calendar.DAY_OF_MONTH);
  
        HospedajeDTO hosDto = fachada.consultarHospedaje(id_cliente, fecha, fecha_e);
       
        FacturaDTO factDTO = fachada.registrarFacturaHospedaje(id_cliente, "" + hosDto.getId());
        
    }
    
    response.sendRedirect("../consultarHospedajesActivos.jsp");
%>