<%-- 
    Document   : modificarReserva
    Created on : 02-abr-2016, 11:50:34
    Author     : Javier
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReservaRecursoDTO"%>
<%@page import="dto.ClienteDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Fachada fachada = new Fachada();
    String id_cliente = request.getParameter("id_cliente");
    String nombre_recurso = request.getParameter("nombre_recurso");
    String fecha_inicio = request.getParameter("fecha_inicio");
    String fecha_fin = request.getParameter("fecha_fin");
    String servicios = request.getParameter("servicios");
    ReservaRecursoDTO dto = fachada.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_inicio, fecha_fin);
    ClienteDTO dtoC = fachada.consultarCliente(id_cliente);
    ArrayList<String> recurso = fachada.obtenerRecursosDisponibles(dto.getFecha_inicio(), dto.getFecha_final());


%>

<jsp:include page="../plantillas/admin/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 30px;">
                                <center><h2> Modificar Reservar recurso </h2>
                                 <label id="modificar">  </label></center>
                                <form name="registrarForm" id="registrarForm" action="javascript:modificarReservaRecurso()" method="post">
                                    <table id="tablaAdmin" class="table table-bordered table-striped" style="float:left">
                                             <legend><i class="fa fa-home"> Información Recurso Actual</i></legend>
                                            <td> Nombre del recurso</td>
                                            <td>
                                                <input type="text" value="<%=dto.getNombreRecurso()%>" readonly="true" name="txtNombreRecursoP" id="txtNombreRecursoP" class="form-control"/> 
                                            </td>
                                             <td> Fecha de entrada</td>
                                            <td>
                                                <input type="text" value="<%=dto.getFecha_inicio()%>" readonly="true" name="txtFechaInicioP" id="txtFechaInicioP" class="form-control"/> 
                                            </td>
                                             <td> Fecha de salida</td>
                                            <td>
                                                <input type="text" value="<%=dto.getFecha_final()%>" readonly="true" name="txtFechaFinP" id="txtFechaFinP" class="form-control"/> 
                                            </td>
                                            <td> Servicios</td>
                                            <td>
                                                <input type="text" value="<%=dto.getServicios()%>" readonly="true" name="txtServiciosP" id="txtServiciosP" class="form-control"/> 
                                            </td>
                                            
                                    <div id="tablaAdmin">
                                        <table id="tablaAdmin" class="table table-bordered table-striped" style="float:left">
                                             <legend><i class="fa fa-book"> Actualizar Recurso</i></legend>
                                            <tr>
                                                <td> Seleccione fecha de entrada</td>
                                                <td>
                                                    <input required type="date" name="txtFecha_entrada" id="txtFecha_entrada" class="form-control" placeholder="Fecha entrada" onchange="javascript:validarCampoFechas()"/>
                                                </td>
                                                <td> Seleccione fecha de salida</td>
                                                <td>
                                                    <input required type="date" name="txtFecha_salida" id="txtFecha_salida" class="form-control" placeholder="Fecha salida" onchange="javascript:validarCampoFechas()"/>
                                                </td>
                                        </table>
                                        <div id="cargar">
                                        <table id="tablaRecurso" class="table table-bordered table-striped" onchange="javascript:validarRecurso()">
                                                <td> Recurso</td>
                                                <td> <select id="recurso" name="recurso" class="form-control">
                                                        <option> Recursos No Disponibles</option>
                                                    </select> </td>
                                        </table>      
                                        </div>
                                        <div id="tarifa">
                                            <table id="tablaTarifa" class="table table-bordered table-striped">
                                                <tr>
                                                    <td> Tarifa de Recurso</td>
                                                    <td>
                                                        <input type="text" name="txtTarifa" id="txtTarifa" class="form-control" readonly="true"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table id="tableAdmin" class="table table-bordered table-striped">
                                            <td> Seleccione servicios asistenciales: </td>
                                            <td> <input type="checkbox" name="servicio" id="meseria" value="Meseros">Mesería </td>
                                                  <td>  <input type="checkbox" name="servicio" id="chef" value="Chefs">Chefs </td>
                                                  <td>  <input type="checkbox" name="servicio" id="decoracion" value="Decoracion">Decoración</td>
                                                 <td>   <input type="checkbox" name="servicio" id="animacion" value="Animacion">Animación</td>
                                                 <td>   <input type="checkbox" name="servicio" id="silleteria" value="Silleteria">Silletería</td>
                                                 <td>   <input type="checkbox" name="servicio" id="VideoBeam" value="VideoBeam">VideoBeam</td>
                                                  <td>  <input type="checkbox" name="servicio" id="Recreacionistas" value="Recreacionistas">Recreacionistas
                                                </td>
                                            </tr>
                                        </table>
                                        <div id="cambioCliente">
                                        <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                             <legend><i class="fa fa-user"> Información Del Cliente</i></legend>
                                            <tr>
                                                <td>N° Documento </td>
                                                <td><input required type="text" readonly="true" name="txtDocumento" value="<%=dtoC.getId_cliente()%>" id="txtDocumento" placeholder="Documento cliente" class="form-control"</td>
                                                <td>Nombre cliente </td>
                                                <td><input required type="text" readonly="true" name="txtNombre" value="<%=dtoC.getNombre_cliente() %>" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                <td>Apellido </td>
                                                <td><input required type="text" readonly="true" name="txtApellido" value="<%=dtoC.getApellido()%>" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                        </tr><tr>
                                            <td>Teléfono </td>
                                                <td><input required type="text" readonly="true" name="txtTelefono" value="<%=dtoC.getTelefono()%>" id="txtTelefono" placeholder="Telefono" class="form-control"</td>
                                                <td>Email </td>
                                                <td><input required type="text" readonly="true" name="txtEmail" value="<%=dtoC.getEmail()%>" id="txtEmail" placeholder="Correo electronico" class="form-control"</td>
                                                <td>Procedencia </td>
                                                <td><input required type="text" readonly="true" name="txtProcedencia" value="<%=dtoC.getProcedencia()%>" id="txtProcedencia" placeholder="Procedencia" class="form-control" </td>
                                            </tr>
                                        </table>
                                        </div>
                                    </div>
                                    <br>
                                    <input type="submit" class="btn btn-primary"  value="Actualizar" name="Actualizar" id="Actualizar"/>
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
    <script src="js/recurso.js" type="text/javascript"></script>

<jsp:include page="../plantillas/admin/footer.jsp"/>