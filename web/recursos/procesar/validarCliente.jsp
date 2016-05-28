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
    ClienteDTO cliente= null;
    if (exito) {
         cliente = fachada.consultarCliente(id_cliente);
    }   
%>
<% if(exito){%>
<table id="tabRec" class="table table-bordered table-striped"> 
    <label><i class="fa fa-user"></i> Información del cliente </label>
    <tr> 
        <td>N° Documento </td>
        <td><input type="text" name="txtDocumento" value="<%= cliente.getId_cliente()%>" id="txtDocumento" placeholder="Documento cliente" class="form-control" onchange="javascript:validarInformacionCliente()"> </td>
        <td>Nombre cliente</td>
        <td><input type="text" name="txtNombre" value="<%= cliente.getNombre_cliente()%>" readonly="true" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
        <td>Apellido </td>
        <td><input type="text" name="txtApellido" value="<%= cliente.getApellido()%>" id="txtApellido" readonly="true" placeholder="Apellido usuario" class="form-control"></td>    
    </tr><tr>
        <td>Teléfono </td>
        <td><input type="text" name="txtTelefono" value="<%=cliente.getTelefono()%>" id="txtTelefono"  readonly="true"placeholder="Telefono" class="form-control"> </td>
        <td>Email </td>
        <td><input type="text" name="txtEmail" value="<%=cliente.getEmail()%>" id="txtEmail"  readonly="true"placeholder="Email" class="form-control"> </td>
        <td>Procedencia </td>
        <td><input type="text" value="<%= cliente.getProcedencia()%>" name="txtProcedencia" readonly="true" id="txtProcedencia" placeholder="Procedencia" class="form-control"> </td>
    </tr>
</table>
<%
    }else{
%><table id="tablaAdmin" class="table table-bordered table-striped"> 
    <label><i class="fa fa-user"></i> Información del cliente </label>
    <tr> 
        <td>N° Documento </td>
        <td><input type="text" name="txtDocumento" value="<%= id_cliente%>" id="txtDocumento" placeholder="Documento cliente" class="form-control" onchange="javascript:validarInformacionCliente()"> </td>
        <td>Nombre cliente</td>
        <td><input type="text" name="txtNombre" value="" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
        <td>Apellido </td>
        <td><input type="text" name="txtApellido" value="" id="txtApellido"  placeholder="Apellido usuario" class="form-control"></td>
    </tr><tr>
        <td>Teléfono </td>
        <td><input type="text" name="txtTelefono" value="" id="txtTelefono"  placeholder="Telefono" class="form-control"> </td>
        <td>Email </td>
        <td><input type="text" name="txtEmail" value="" id="txtEmail"  placeholder="Email" class="form-control"> </td>
        <td>Procedencia </td>
        <td><input type="text" value="" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control"> </td>
    </tr>
</table>
    <% 
        }
%>