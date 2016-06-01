<%-- 
    Document   : consultarFacturasHospedaje
    Created on : 1/06/2016, 07:23:24 AM
    Author     : tuto2
--%>

<%@page import="dto.FacturaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../plantillas/admin/header.jsp"/>
<%

    Fachada fachada = new Fachada();
    String id_recurso = request.getParameter("id_recurso");

    ArrayList<FacturaDTO> factura = fachada.consultarFacturaHospedaje(id_recurso);


%>

<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 30px;">
                            <form name="form1" action="consultarFacturasHospedaje.jsp" method="POST">
                                <center><h1> Facturas Hospedaje </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                        <input type="text" name="id_recurso" id="id_recurso" placeholder="ID hospedaje..." class="form-control">
                                        
                                        
                                         <span class="input-group-btn">
                                            <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                        </span>
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
                                                    <td> <a target="_blank" class="btn btn-dropbox" href="../public/jsp/factura.jsp?tipo_servicio=<%= re.getTipo_servicio()%>&id_servicio=<%= re.getId_servicio()%>">Generar PDF</a></td>
                                                </tr> 
                                                <tr>
                                            
                                            </tr>
                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                            </form>
                        </div>
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
<script src="js/recurso.js" type="text/javascript"></script>


<jsp:include page="../plantillas/admin/footer.jsp"/>
