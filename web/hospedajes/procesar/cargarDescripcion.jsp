<%-- 
    Document   : cargarDescripcion
    Created on : 23-may-2016, 20:58:58
    Author     : Javier
--%>

<%@page import="dto.HabitacionDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("habitacion");
    Fachada fachada = new Fachada();
    HabitacionDTO h = fachada.consultarHabitacion(id);
    if (h != null) {
%>
<div class="input-field col s6">
    <textarea readonly="true" placeholder=" nnn" id="txtDescripcion" name="txtDescripcion" class="materialize-textarea validate" >
        Tipo: <%= h.getTipo() %>
        Descripción: <%= h.getDescripcion() %>
    </textarea>
    <label class="active" for="txtDescripcion">Descripcion</label>
</div>
<% }%>