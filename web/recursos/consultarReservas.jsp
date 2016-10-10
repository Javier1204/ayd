<%-- 
    Document   : consultarReservas
    Created on : 02-abr-2016, 11:50:24
    Author     : Javier
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("pagina", "hospedajes");
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
        <i class="material-icons left grey-text">search</i><h5>Buscar hospedaje</h5>
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
                <div class="input-field col s3">
                    <input type="text" name="id_cliente" id="id_cliente" class="validate" required/>
                    <label for="id_cliente"><i class="material-icons left">search</i> Id cliente</label>
                </div>
                <div class="input-field col s3">
                    <label for="txtFecha_entrada">Fecha entrada</label>
                    <input type="text" name="txtFecha_entrada" id="txtFecha_entrada" class="datepicker">
                </div>
                <div class="input-field col s3">
                    <label for="txtFecha_salida">Fecha salida</label>
                    <input type="text" name="txtFecha_salida" id="txtFecha_salida" class="datepicker">
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
                    <th data-field="editar">Acción</th>
                </tr>
            </thead>
            <%
                Fachada fachada = new Fachada();
                ArrayList<ReservaRecursoDTO> reserva = fachada.obtenerReservasRecurso();
                for (ReservaRecursoDTO re : reserva) {
            %>
            <tr>
                <td> <%= re.getNombreRecurso()%> </td>
                <td> <%= re.getId_cliente()%> </td>
                <td> <%= re.getServicios()%> </td> 
                <td> <%= re.getFecha_inicio()%> </td>
                <td> <%= re.getFecha_final()%> </td>
                <td> <a href="modificarReserva.jsp?nombre_recurso=<%= re.getNombreRecurso()%>&fecha_inicio=<%= re.getFecha_inicio()%>&fecha_fin=<%= re.getFecha_final()%>&servicios=<%= re.getServicios()%>&id_cliente=<%= re.getId_cliente()%>">Actualizar</a></td>
                <td> <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Cancelar</a>
                    <div id="modal1" class="modal">
                        <div class="modal-content">
                            <h4>Modal Header</h4>
                            <p>A bunch of text</p>
                        </div>
                        <div class="modal-footer">
                            <a href="procesar/cancelarReservaR.jsp?nombre_recurso=<%=re.getNombreRecurso()%>&id_cliente=<%=re.getId_cliente()%>
                               &servicios=<%=re.getServicios()%>&fecha_entrada=<%=re.getFecha_inicio()%>&fecha_salida=<%=re.getFecha_final()%>" 
                               class=" modal-action modal-close waves-effect waves-green btn-flat">Sí</a>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>

            </tr>
            <% }%>
        </table>
    </div>
</div>
<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/recurso.js" type="text/javascript"></script>
<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>

<%-- Viejo
<jsp:include page="../plantillas/admin/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 30px;">
                            <form name="form1" action="javascript:consultarReservaRecurso()" method="POST">
                                <center><h1> Recursos </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                        <input type="text" name="txtBusq" id="txtBusq" placeholder="Documento del cliente..." class="form-control">
                                        <span class="input-group-addon"></span>
                                        <input type="text" name="txtNombreR" id="txtNombreR" placeholder="Nombre del recurso..." class="form-control">
                                        <span class="input-group-addon">F.I</span>
                                        <input type="Date" name="txtFechaInicio" id="txtFechaInicio" placeholder="Fecha inicio de la reserva..." class="form-control">
                                        <span class="input-group-addon">F.F</span>
                                        <input type="Date" name="txtFechaFin" id="txtFechaFin" placeholder="Fecha salida de la reserva..." class="form-control"/>
                                        <span class="input-group-btn">
                                            <input type="submit" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                        </span>
                                    </div>
                                    <br>
                                    <div id="consulta">
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <thead style="background-color: #2c3b41; color: #fff">
                                                <tr>
                                                    <th> Recurso </th>
                                                    <th> Cliente a cargo </th>
                                                    <th> Servicios Asistenciales </th>
                                                    <th> Fecha de entrada </th>
                                                    <th> Fecha de salida </th>
                                                    <th> Acción </th>
                                                    <th> Acción </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Fachada fachada = new Fachada();
                                                    ArrayList<ReservaRecursoDTO> reserva = fachada.obtenerReservasRecurso();
                                                    for (ReservaRecursoDTO re : reserva) {
                                                %>
                                                <tr>
                                                    <td> <%= re.getNombreRecurso()%> </td>
                                                    <td> <%= re.getId_cliente()%> </td>
                                                    <td> <%= re.getServicios()%> </td> 
                                                    <td> <%= re.getFecha_inicio()%> </td>
                                                    <td> <%= re.getFecha_final()%> </td>
                                                    <td> <a class="btn btn-dropbox" href="modificarReserva.jsp?nombre_recurso=<%= re.getNombreRecurso()%>&fecha_inicio=<%= re.getFecha_inicio()%>&fecha_fin=<%= re.getFecha_final()%>&servicios=<%= re.getServicios()%>&id_cliente=<%= re.getId_cliente()%>">Actualizar</a></td>
                                                    <td> <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"> Cancelar</button> </td>
                                                </tr> 
                                                <tr>
                                            <div class="modal fade" id="myModal" role="dialog">
                                                <div class="modal-dialog modal-sm">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <legend>¿Está seguro de cancelar reserva?</legend>
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-md-1">
                                                                        <a type="button" name="si" id="si" href="procesar/cancelarReservaR.jsp?nombre_recurso=<%=re.getNombreRecurso()%>&id_cliente=<%=re.getId_cliente()%>&servicios=<%=re.getServicios()%>&fecha_entrada=<%=re.getFecha_inicio()%>&fecha_salida=<%=re.getFecha_final()%>" class="btn btn-adn"> Sí</a>
                                                                    </div>
                                                                    <div class="col-md-1"></div>
                                                                    <div class="col-md-1">
                                                                        <button type="button" name="no" id="no" data-dismiss="modal" class="btn btn-adn"> No</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
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
--%>