<%-- 
    Document   : verReservas
    Created on : May 31, 2016, 11:07:17 AM
    Author     : Mauricio
--%>

<%@page import="dto.ReservaDTO"%>
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
                            <form name="form1" action="javascript:consultarReserva()" method="POST">
                                <center><h1> Consultar Reservas </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                        <input type="text" name="txtBusq" id="txtBusq" placeholder="Documento cliente..." class="form-control"/> 
                                        <span class="input-group-addon">-</span>
                                            <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                        </span>
                                    </div>
                                    <br>
                                    <div id="cambio">
                                    <table id="tablaAdmin" class="table table-bordered table-striped">
                                        <thead style="background-color: #2c3b41; color: #fff">
                                            <tr>
                                                <th> ID Reserva </th>
                                                <th> ID Cliente Asignado </th>
                                                <th> Fecha entrada </th>
                                                <th> Fecha salida </th>
                                                <th> Cancelar </th>
                                                <th> Hospedar </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Fachada fachada = new Fachada();
                                                ArrayList<ReservaDTO> resv = fachada.obtenerReservas();
                                                for (ReservaDTO d : resv) {
                                            %>
                                            <tr>
                                                <td> <%= d.getId_reserva() %></td>
                                                <td> <%= d.getId_cliente() %> </td>
                                                <td> <%= d.getFecha_inicio() %> </td>
                                                <td> <%= d.getFecha_salida() %></td>
                                                <td>
                                                    <a class="btn btn-rojo" href="procesar/procesarCancelacion.jsp?id_reserva=<%=d.getId_reserva()%>">Cancelar</a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-info" href="procesar/procesarConversion.jsp?id_habitacion=<%=d.getId_habitacion()%>
                                                       &id_cliente=<%=d.getId_cliente()%>&cantPersonas=<%=d.getCantPersonas()%>&fecha_inicio=<%=d.getFecha_inicio()%>
                                                       &fecha_salida=<%=d.getFecha_salida()%>&nombre_cliente=<%=d.getNombreCliente()%>&telefono=<%=d.getTelefono()%>
                                                       &email=<%=d.getEmail()%>&apellido_cliente=<%=d.getApellido_Cliente()%>&id_reserva=<%=d.getId_reserva()%>">Hospedar</a>
                                                </td>
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