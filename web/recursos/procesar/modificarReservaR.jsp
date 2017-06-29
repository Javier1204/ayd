<%-- 
    Document   : modificarReservaR
    Created on : 27-may-2016, 22:19:01
    Author     : FARID SANTIAGO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.FacturaDTO"%>
<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="facade.Fachada" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_cliente = request.getParameter("idCliente");
    String nombre_recurso = request.getParameter("nombreRecurso");
    String fecha_entrada = request.getParameter("fechaEntrada");
    String fecha_salida = request.getParameter("fechaSalida");
    String servicios = request.getParameter("servicios");
    String nombreRecursoP = request.getParameter("nombreRecursoP");
    String fechaInicioP = request.getParameter("fechaInicioP");
    String fechaFinP = request.getParameter("fechaFinP");
    System.out.println(fecha_entrada);
    System.out.println(fecha_salida);
    System.out.println(fechaInicioP);
    System.out.println(fechaFinP);
    Fachada fachada = new Fachada();
    
    boolean exito = false;
    ReservaRecursoDTO dto = fachada.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida);
    exito = fachada.modificarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida, servicios, nombreRecursoP, fechaInicioP, fechaFinP);

    String resp = "";
    if (exito) {
        resp = "Si";
        ReservaRecursoDTO resRec = fachada.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida);
        ArrayList<FacturaDTO> factDTO = fachada.consultarFacturaResRecurso("" + resRec.getId());
        for (FacturaDTO re : factDTO) {
            System.out.println("dddddddddd "+ re.getId_servicio()+ re.getDescripcion());
            fachada.actualizarFacturaRecurso(re);
        }

    } else {
        resp = "No";
    }


%>
