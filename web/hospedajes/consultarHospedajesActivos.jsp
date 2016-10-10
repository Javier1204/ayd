<%-- 
    Document   : consultarHospedajesActivos
    Created on : 23-may-2016, 10:50:56
    Author     : Javier
--%>

<%@page import="dto.HospedajeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.setAttribute("pagina", "hospedajes");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("empleado") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
%>
<jsp:include page="../plantillas/recepcionista/header.jsp"/>
<%--  Nuevo --%>
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
                    <form name="formBuscar" id="formBuscar" method="post" action="javascript:consultarHospedajeActivo()"> 
                        <div class="input-field col s5">
                            <input type="text" name="id_hab" id="id_hab" required/>
                            <label for="id_hab"><i class="material-icons left">search</i> Habitación</label>
                        </div>
                        <div class="input-field col s5">
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
                    <th data-field="editar">Acción</th>
                </tr>
            </thead>
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
                <td> <a  href="modificarHospedaje.jsp?id_habitacion=<%=h.getId_habitacion()%>&id_cliente=<%=h.getId_cliente()%>">Modificar </a></td>
                <td> <a  href="procesar/finalizarHospedaje.jsp?id=<%=h.getId()%>&id_habitacion=<%=h.getId_habitacion()%>&id_cliente=<%=h.getId_cliente()%>&fecha_s=<%= h.getFecha_salida()%>&fecha_e=<%= h.getFecha_entrada()%>">Finalizar </a></td>
            </tr>
            <% }%>
        </table>
    </div>
</div>
<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/procesar.js" type="text/javascript"></script>

<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>