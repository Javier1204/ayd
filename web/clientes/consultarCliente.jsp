<%-- 
    Document   : consultarCliente
    Created on : 02-abr-2016, 11:46:51
    Author     : Javier
--%>

<%@page import="dto.ClienteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/procesar.js" type="text/javascript"></script>


<jsp:include page="../plantillas/admin/footer.jsp"/>

