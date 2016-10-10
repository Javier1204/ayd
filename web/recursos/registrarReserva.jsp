<%-- 
    Document   : registrarReserva
    Created on : 02-abr-2016, 11:50:15
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- nuevo --%>
<% session.setAttribute("pagina", "servicios");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("empleado") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
%>
<jsp:include page="../plantillas/recepcionista/header.jsp"></jsp:include>
    <div class="card-panel  white z-depth-5">
        <div class="row">
            <div class="col s12 m12 l12">
                <div id="form_reg_servicio">
                    <form name="registrarForm" id="registrarForm" action="javascript:registrarReservaRecurso()" method="post" class="s12">
                        <div class="row">
                            <i class="material-icons left grey-text">queue</i><h5>Registar servicio</h5>
                            <li class="divider"></li>
                        </div>
                        <center><label id="registrar"></label></center>
                        <div class="row">
                            <div class="s12">
                                <legend><i class="material-icons left grey-text">perm_identity</i> Información de servicio </legend>
                                <li class="divider"></li>
                            </div>
                        </div>
                        <div class="row">
                            <div class="s12" >
                                <div class="row">
                                        <div class="input-field	col s6" class="validate">
                                            <label for="txtFecha_entrada">Fecha entrada</label>
                                            <input type="text" name="txtFecha_entrada" id="txtFecha_entrada" class="datepicker" onchange="javascript:validarCampoFechas()"/>
                                        </div>
                                        <div class="input-field	col s6" class="validate">
                                            <label for="txtFecha_salida">Fecha salida</label>
                                            <input type="text" name="txtFecha_salida" id="txtFecha_salida" class="datepicker" onchange="javascript:validarCampoFechas()"/>
                                        </div>
                                </div>
                                <div class="row">
                                    <div  id="cargar">
                                        <div class="input-field col s6">
                                            <select id="servicio" class="validate" name="servicio" onchange="javascript:validarRecurso()">
                                                <option value="" disabled selected>--Seleccione una opción--</option>
                                            </select>
                                            <label for="servicio">Servicio</label>
                                        </div>
                                    </div>
                                    <div id="tarifa">
                                        <div class="input-field col s6">
                                            <input id="txtTarifa" readonly="true" name="txtTarifa" class="validate" />
                                            <label for="txtTarifa">Tarifa</label>
                                        </div>
                                    </div>
                                </div>
                                <label>Servicios asistenciales:</label>
                                <input name="servicio" value="Meseros" type="checkbox" id="meseria" />
                                <label for="meseria">Meseros</label>

                                <input name="servicio" value="Chefs" type="checkbox" id="chef" />
                                <label for="chef">Chefs</label>

                                <input name="servicio" value="Decoración" type="checkbox" id="decoracion" />
                                <label for="decoracion">Decoración</label>

                                <input name="servicio" value="Animación" type="checkbox" id="animacion" />
                                <label for="animacion">Animación</label>

                                <input name="servicio" value="Silletería" type="checkbox" id="silleteria" />
                                <label for="silleteria">Silletería</label>

                                <input name="servicio" value="VideoBeam" type="checkbox" id="VideoBeam" />
                                <label for="VideoBeam">VideoBeam</label>

                                <input name="servicio" value="Recreacionistas" type="checkbox" id="Recreacionistas" />
                                <label for="Recreacionistas">Recreacionistas</label> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="s12">
                                <legend><i class="material-icons left grey-text">perm_identity</i> Información de cliente </legend>
                                <li class="divider"></li>
                            </div>
                        </div>
                        <div class="s12">
                            <div id="cambioCliente">
                            <div class="input-field	col s4" class="validate">
                                <label for="txtDocuemnto">Documento cliente</label>
                                <input type="text" name="txtDocumento" id="txtDocumento" class="validate" onchange="javascript:validarInformacionCliente()">
                            </div>

                            <div class="input-field	col s4" class="validate">
                                <label for="txtNombre">Nombres cliente</label>
                                <input type="text" name="txtNombre" id="txtNombre" class="validate" >
                            </div>

                            <div class="input-field	col s4" class="validate">
                                <label for="txtApellido">Apellidos cliente</label>
                                <input type="text" name="txtApellido" id="txtApellido" class="validate" >
                            </div>

                            <div class="input-field	col s4" class="validate">
                                <label for="txtTelefono">Telefono cliente</label>
                                <input type="tel" name="txtTelefono" id="txtTelefono" class="validate" >
                            </div>

                            <div class="input-field	col s4" class="validate">
                                <label for="txtEmail">Email cliente</label>
                                <input type="email" name="txtEmail" id="txtEmail" class="validate" >
                            </div>

                            <div class="input-field	col s4" class="validate">
                                <label for="txtProcedencia">Procedencia cliente</label>
                                <input type="text" name="txtProcedencia" id="txtProcedencia" class="validate" >
                            </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <input type="submit" class="btn center-align grey darken-3 right" value="Registrar">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>


<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/recurso.js" type="text/javascript"></script>


<jsp:include page="../plantillas/recepcionista/footer.jsp"/>
<% }
    }%>
<%-- viejo 
<jsp:include page="../plantillas/admin/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 30px;">
                                <center><h2> Reservar recurso </h2>
                                 <label id="registrar">  </label></center>
                                <form name="registrarForm" id="registrarForm" action="javascript:registrarReservaRecurso()" method="post">
                                    <div id="tablaAdmin">
                                        <table id="tablaAdmin" class="table table-bordered table-striped" style="float:left">
                                            <legend><i class="fa fa-book"> Información Recurso</i></legend>
                                            <tr>
                                                <td> Seleccione fecha de entrada</td>
                                                <td>
                                                    <input type="date" name="txtFecha_entrada" id="txtFecha_entrada" class="form-control" placeholder="Fecha entrada" onchange="javascript:validarCampoFechas()"/>
                                                </td>
                                                <td> Seleccione fecha de salida</td>
                                                <td>
                                                    <input type="date" name="txtFecha_salida" id="txtFecha_salida" class="form-control" placeholder="Fecha salida" onchange="javascript:validarCampoFechas()"/>
                                                </td>
                                            </tr>
                                        </table>
                                        <div id="cargar">
                                        <table id="tablaRecurso" class="table table-bordered table-striped">
                                            <tr>
                                                <td> Recurso</td>
                                                <td> <select id="recurso" name="recurso" class="form-control" onchange="javascript:validarRecurso()">
                                                        <option> -Sin selección-</option>
                                                    </select> </td>
                                            </tr>
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
                                            <tr>
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
                                                <td><input type="text" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control" onchange="javascript:validarInformacionCliente()"</td>
                                                <td>Nombre cliente </td>
                                                <td><input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                <td>Apellido </td>
                                                <td><input type="text" name="txtApellido" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                        </tr><tr>
                                            <td>Teléfono </td>
                                                <td><input type="text" name="txtTelefono" id="txtTelefono" placeholder="Telefono" class="form-control"</td>
                                                <td>Email </td>
                                                <td><input type="text" name="txtEmail" id="txtEmail" placeholder="Correo electronico" class="form-control"</td>
                                                <td>Procedencia </td>
                                                <td><input type="text" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control" </td>
                                            </tr>
                                        </table>
                                        </div>
                                    </div>
                                    <br>
                                    <input type="submit" class="btn btn-primary"  value="Registrar" name="registrar" id="registrar"/>
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
--%>