<%-- 
    Document   : modificarHospedaje
    Created on : 02-abr-2016, 11:48:22
    Author     : Javier
--%>

<%@page import="dto.HabitacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ClienteDTO"%>
<%@page import="dto.HospedajeDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Fachada fachada = new Fachada();
    String id_habitacion = request.getParameter("id_habitacion");
    String id_cliente = request.getParameter("id_cliente");
    HospedajeDTO h = fachada.consultarHospedajeActivo(id_cliente, id_habitacion);
    ClienteDTO c = fachada.consultarCliente(id_cliente);
    ArrayList<String> habitaciones = fachada.obtenerHabitacionesDisponibles(h.getCantPersonas(), h.getFecha_salida());
    
%>   
<jsp:include page="../plantillas/admin/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 30px;">
                                <center><h2> Modificar hospedaje </h2>
                                    <label id="divResultado">  </label></center>
                                <form name="modificarForm" id="registrarForm" action="javascript:modificarHospedaje()" method="post">
                                    <div id="tablaAdmin">
                                        <div id="divCambio">
                                            <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                                <legend><i class="fa fa-user"></i> Información del cliente </legend>
                                                <tr> 
                                                    <td>N° Documento </td>
                                                    <td><input required type="text" readonly="true" value="<%=c.getId_cliente()%>" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control"> </td>
                                                <td>Nombre cliente</td>
                                                <td><input required type="text" readonly="true" value="<%= c.getNombre_cliente()%>" name="txtNombre" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                <td>Apellido </td>
                                                <td><input required type="text" readonly="true" value="<%=c.getApellido()%>" name="txtApellido" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                            </tr><tr>
                                                <td>Telefono </td>
                                                <td><input required type="tel" readonly="true" value="<%=c.getTelefono()%>" name="txtTelefono" id="txtTelefono" placeholder="Telefono" class="form-control"> </td>
                                                <td>e-mail</td>
                                                <td><input required type="email" readonly="true" value="<%=c.getEmail()%>" name="txtEmail" id="txtEmail" placeholder="e-mail" class="form-control"></td>
                                                <td>Procedencia </td>
                                                <td><input required type="text" readonly="true" value="<%=c.getProcedencia()%>" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control"> </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <table id="tablaAdmin" class="table table-bordered table-striped">
                                        <legend><i class="fa fa-book"></i> Información hospedaje </legend>
                                        <tr>
                                            <td> Habitación actual</td>
                                            <td> <input required type="text" readonly="true" value="<%=h.getId_habitacion()%>" name="txtHabAnt" id="txtHabAnt" class="form-control" onchange="javascript:validarCampoPersonas()"> </td>
                                            <td>Cantidad personas </td>
                                            <td><input required type="number" value="<%=h.getCantPersonas()%>" name="txtCantPer" id="txtCantPer" placeholder="Cantidad de personas" onchange="javascript:validarCampoFecha()" class="form-control"></td>
                                            <td> Fecha salida</td>
                                            <td> <input required type="date" value="<%=h.getFecha_salida()%>" name="txtFecha_salida" id="txtFecha_salida" placeholder="Fecha salida" class="form-control" onchange="javascript:validarCampoPersonas()"> </td>
                                        </tr>
                                    </table>  
                                    <div><legend><i class="fa fa-home"></i> Información habitación </legend></div>
                                    <div id="cargar" style="float:left">
                                        <% if (habitaciones.size() > 0 && habitaciones != null) {%>
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <tr>
                                                <td> Habitación</td>
                                                <td> <select id="habitacion" name="habitacion" class="form-control">
                                                        <% for (String hab : habitaciones) {%>
                                                        <option> <%= hab%></option>
                                                        <% } %>
                                                    </select> </td>
                                            </tr>
                                            <tr> </tr>
                                        </table>
                                        <% } else { %>
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <tr>
                                                <td> Habitación</td>
                                                <td> <select required id="habitacion" name="habitacion" class="form-control">
                                                        <option value="">-Sin habitaciones disponibles-</option>
                                                    </select> </td>
                                            </tr>
                                            <tr> </tr>
                                        </table>
                                        <% }%>
                                    </div>
                                    <div id="descripcion" style="float:left">
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <tr>
                                                <td> Descripción habitación</td>
                                                <td> <input type="text" name="txtDescripcion" id="txtDescripcion" class="form-control" </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <table id="tablaAdmin" class="table table-bordered table-striped">
                                    <tr><td> </td></tr>
                                </table>
                                <input type="submit" class="btn btn-primary" value="Modificar" name="modificar" id="modificar"/> 
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