<%-- 
    Document   : consultarHospedajesActivos
    Created on : 23-may-2016, 10:50:56
    Author     : Javier
--%>

<%@page import="dto.HospedajeDTO"%>
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
                            <form name="form1" action="javascript:consultarHospedajeActivo()" method="POST">
                                <center><h1> Hospedajes Activos </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                        <input required type="text" name="txtBusq" id="txtBusq" placeholder="Documento cliente..." class="form-control"/> 
                                        <span class="input-group-addon">-</span>
                                        <input required type="text" name="txtHabitacion" id="txtHabitacion" placeholder="Habitación..." class="form-control"/>
                                        <span class="input-group-btn">
                                            <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                        </span>
                                    </div>
                                    <br>
                                    <div id="cambio">
                                    <table id="tablaAdmin" class="table table-bordered table-striped">
                                        <thead style="background-color: #2c3b41; color: #fff">
                                            <tr>
                                                <th> Id. </th>
                                                <th> Habitación </th>
                                                <th> Cliente a cargo </th>
                                                <th> Fecha entrada </th>
                                                <th> Fecha salida </th>
                                                <th> Acción </th>
                                                <th> Acción </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Fachada fachada = new Fachada();
                                                ArrayList<HospedajeDTO> hospedajes = fachada.obtenerHospedajesActivos();
                                                System.out.println(hospedajes);
                                                for (HospedajeDTO h : hospedajes) {
                                            %>
                                            <tr>
                                                <td> <%=h.getId()%></td>
                                                <td> <%= h.getId_habitacion()%></td>
                                                <td> <%= h.getId_cliente()%> </td>
                                                <td> <%= h.getFecha_entrada()%> </td>
                                                <td> <%= h.getFecha_salida()%></td>
                                                <td> <a class="btn btn-info" href="modificarHospedaje.jsp?id_habitacion=<%=h.getId_habitacion()%>&id_cliente=<%=h.getId_cliente()%>">Modificar </a></td>
                                                <td> <a class="btn btn-danger" href="procesar/finalizarHospedaje.jsp?id=<%=h.getId()%>&id_habitacion=<%=h.getId_habitacion()%>&id_cliente=<%=h.getId_cliente()%>&fecha_s=<%= h.getFecha_salida()%>&fecha_e=<%= h.getFecha_entrada()%>">Finalizar </a></td>
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