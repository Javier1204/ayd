<%-- 
    Document   : registrarReserva
    Created on : 02-abr-2016, 11:50:15
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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