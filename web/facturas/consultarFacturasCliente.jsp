<%-- 
    Document   : verHospedajes
    Created on : 02-abr-2016, 11:46:13
    Author     : Javier
--%>

<%@page import="dto.FacturaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.setAttribute("pagina", "facturas");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("empleado") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
            Fachada fachada = new Fachada();
            
            
            ArrayList<FacturaDTO> factura = new ArrayList<FacturaDTO>();
            
            if (request.getParameter("txtIdCliente")!= null) {
                System.out.println("hola");
                String id_cliente = request.getParameter("txtIdCliente");
                
                factura = fachada.consultarFacturaCliente(id_cliente);
            } else {
                System.out.println("hola2");
                factura = fachada.mostrarFacturas();
                
            }
%>
<jsp:include page="../plantillas/recepcionista/header.jsp"/>
<div class="card-panel  white z-depth-5" >
    <div class="row">
        <i class="material-icons left grey-text">search</i><h5>Facturas de clientes</h5>
        <li class="divider"></li>
    </div>
    <div class="row">
        <div class=" col s12">
            <label for=""> <h5>Ingrese información</h5></label>
        </div>
    </div>

    <form name="form1" action="consultarFacturasCliente.jsp" method="POST">

        <div id="tablaAdmin">
            <label> 
                Buscar:
            </label>  
            <div class="row">

                <div class="input-group col s6">
                    <input type="text" name="txtIdCliente" id="txtBusq" placeholder="Documento del cliente..." class="form-control">
                </div>
                <div class=" col s2">
                    <span class="input-group-btn">
                        <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn center-align grey darken-3 right"/>
                    </span>
                </div>
            </div>
            <br>
            <div id="consulta">
                <table id="tablaAdmin" class="table table-bordered table-striped">
                    <thead style="background-color: #2c3b41; color: #fff">
                        <tr>
                            <th> Num factura </th>
                            <th> Tipo servicio </th>
                            <th> Id servicio </th>
                            <th> Documento cliente </th>
                            <th> Fecha factura </th>
                            <th> Precio </th>
                            <th> Acción </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (FacturaDTO re : factura) {
                        %>
                        <tr>
                            <td> <%= re.getNum_factura()%> </td>
                            <td> <%= re.getTipo_servicio()%> </td>
                            <td> <%= re.getId_servicio()%> </td> 
                            <td> <%= re.getId_cliente()%> </td>
                            <td> <%= re.getFecha_factura()%> </td>
                            <td> <%= re.getPrecio()%> </td>
                            <td> <a target="_blank"  href="../public/jsp/factura.jsp?tipo_servicio=<%= re.getTipo_servicio()%>&id_servicio=<%= re.getId_servicio()%>">Generar PDF</a></td>
                        </tr> 
                        <tr>

                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</div>


<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>



<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>