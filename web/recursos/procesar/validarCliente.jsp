<%-- 
    Document   : validarCliente
    Created on : 27-may-2016, 22:17:43
    Author     : FARID SANTIAGO
--%>

<%@page import="dto.ClienteDTO" %>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    System.out.println("Entro");
    String id_cliente = request.getParameter("id");
    Fachada fachada = new Fachada();
    boolean exito = false;
    exito = fachada.validarCliente(id_cliente);
    ClienteDTO cliente = null;
    if (exito) {
        cliente = fachada.consultarCliente(id_cliente);
    }
    System.out.println(exito);
%>
<% if (exito) {%>
<div class="input-field	col s4" class="validate">
    <label class="active" for="txtDocuemnto">Documento cliente</label>
    <input type="text" name="txtDocumento" id="txtDocumento" class="validate" value="<%=cliente.getId_cliente()%>" onchange="javascript:validarInformacionCliente()">
</div>

<div class="input-field	col s4" class="validate">
    <label class="active" for="txtNombre">Nombres cliente</label>
    <input type="text" value="<%=cliente.getNombre_cliente()%>" readonly="true" name="txtNombre" id="txtNombre" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label class="active" for="txtApellido">Apellidos cliente</label>
    <input type="text" value="<%= cliente.getApellido()%>" readonly="true" name="txtApellido" id="txtApellido" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label class="active" for="txtTelefono">Telefono cliente</label>
    <input type="tel" value="<%= cliente.getTelefono()%>" readonly="true" name="txtTelefono" id="txtTelefono" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label class="active" for="txtEmail">Email cliente</label>
    <input type="email" value="<%=cliente.getEmail()%>" readonly="true" name="txtEmail" id="txtEmail" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label class="active" for="txtProcedencia">Procedencia cliente</label>
    <input type="text" value="<%=cliente.getProcedencia()%>" readonly="true" name="txtProcedencia" id="txtProcedencia" class="validate" >
</div>
<%
} else {
%><div class="input-field	col s4" class="validate">
    <label class="active" for="txtDocuemnto">Documento cliente</label>
    <input type="text" name="txtDocumento" value="<%= id_cliente%>" id="txtDocumento" class="validate" onchange="javascript:validarCliente()">
</div>

<div class="input-field	col s4" class="validate">
    <label for="txtNombre">Nombres cliente</label>
    <input type="text" name="txtNombre" id="txtNombre" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label for="txtApellido">Apellidos cliente</label>
    <input type="text" name="txtApellido" id="txtApellido" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label for="txtTelefono">Telefono cliente</label>
    <input type="tel" name="txtTelefono" id="txtTelefono" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label for="txtEmail">Email cliente</label>
    <input type="email" name="txtEmail" id="txtEmail" class="validate" >
</div>

<div class="input-field	col s4" class="validate">
    <label for="txtProcedencia">Procedencia cliente</label>
    <input type="text" name="txtProcedencia" id="txtProcedencia" class="validate" >
</div>
<%
    }
%>