<%-- 
    Document   : consultarCliente
    Created on : 02-abr-2016, 11:46:51
    Author     : Javier
--%>

<%@page import="dto.ClienteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "clientes");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("empleado") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
%>
<%-- Nuevo --%>

<jsp:include page="../plantillas/recepcionista/header.jsp"/>
<div class="card-panel  white z-depth-5" >
    <div class="row">
        <i class="material-icons left grey-text">search</i><h5>Buscar hospedaje activo</h5>
        <li class="divider"></li>
    </div>
    <div class="row">
        <div class=" s12">
            <label for=""> <h5>Ingrese información</h5></label>
        </div>
    </div>
    <div class="row">
        <div class="col s12 m12 l12">
            <form name="formBuscar" id="formBuscar" method="post" action="javascript:consultarHospedaje()">                 
                <div class="input-field col s6">
                    <input type="text" name="id_cliente" id="id_cliente" class="validate" required/>
                    <label for="id_cliente"><i class="material-icons left">search</i> Id cliente</label>
                </div>
                <div class="input-field col s2">
                    <input type="submit" class="btn center-align grey darken-3 right" id="buscar" name="buscar" value="Buscar"/>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="card-panel  white z-depth-5">
    <div id="cambio">
        <table class="striped highlight" bgcolor="white">
            <thead>
                <tr class="grey darken-2 white-text">
                    <th data-field="id">Id</th>
                    <th data-field="tipo">Habitación</th>
                    <th data-field="tarifa">Cliente</th>
                    <th data-field="descripcion">Fecha entrada</th>
                    <th data-field="imagen">Fecha salida</th>
                    <th data-field="editar">Acción</th>
                </tr>
            </thead>
            <%
                Fachada fachada = new Fachada();
                ArrayList<ClienteDTO> clientes = fachada.obtenerClientes();
                for (ClienteDTO c : clientes) {
            %>
            <tr>
                <td> <%= c.getId_cliente()%>  </td>
                <td> <%= c.getNombre_cliente() + " " + c.getApellido()%> </td>
                <td> <%= c.getTelefono()%> </td>
                <td> <%= c.getProcedencia()%> </td>
                <td> <%= c.getEmail()%> </td>
                <td> <a href="modificarCliente.jsp?id_cliente=<%=c.getId_cliente()%>"> Modificar</a></td>
            </tr> 
            <% } %>
        </table>
    </div>
</div>

<%-- viejo 
<jsp:include page="../plantillas/admin/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 30px;">
                            <form name="form1" action="javascript:consultarCliente()" method="POST">
                                <center><h1> Clientes </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                        <input type="text" name="txtBusq" id="txtBusq" placeholder="Search..." class="form-control"/>
                                        <span class="input-group-btn">
                                            <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                        </span>
                                    </div>
                                    <br>
                                    <div id="cambio">
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <thead style="background-color: #2c3b41; color: #fff">
                                                <tr>
                                                    <th> Documento </th>
                                                    <th> Nombre </th>
                                                    <th> Teléfono </th>
                                                    <th> Procedencia </th>
                                                    <th> e-mail </th>
                                                    <th> Acción </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Fachada fachada = new Fachada();
                                                    ArrayList<ClienteDTO> clientes = fachada.obtenerClientes();
                                                    for (ClienteDTO c : clientes) {
                                                %>    
                                                <tr>
                                                    <td> <%= c.getId_cliente()%>  </td>
                                                    <td> <%= c.getNombre_cliente() + " " + c.getApellido()%> </td>
                                                    <td> <%= c.getTelefono()%> </td>
                                                    <td> <%= c.getProcedencia()%> </td>
                                                    <td> <%= c.getEmail()%> </td>
                                                    <td> <a class="btn btn-info" href="modificarCliente.jsp?id_cliente=<%=c.getId_cliente()%>"> Modificar</a></td>
                                                </tr>   
                                                <% }%>   
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>             
        </div>
    </div>
</div>
--%>
<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/procesar.js" type="text/javascript"></script>


<jsp:include page="../plantillas/adminis/footer.jsp"/>

<% }
    }
%>