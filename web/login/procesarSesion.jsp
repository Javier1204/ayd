<%-- 
    Document   : procesarSesion
    Created on : 02-abr-2016, 11:49:30
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("nombre_usuario");
    String password = request.getParameter("password");
    String tipo = request.getParameter("tipo");
    Fachada fachada = new Fachada();
    boolean exito = fachada.iniciarSesion(user, password, tipo);
    String mensaje = "";
    if (exito) {
        if (tipo.equals("administrador")) {
            System.out.println("Entro");
            mensaje = "1";
        } else if(tipo.equals("empleado")) {
            System.out.println("yo igual");
            mensaje= "2";
        }
        session.setAttribute("usuario", tipo);;
        session.setAttribute("estadoSesion", true);

        session.setMaxInactiveInterval(1 * 60 * 60);
    } else {
        mensaje = "Datos incorrectos";
    }
%>
<%= mensaje%>