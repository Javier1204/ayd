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
                                <center><h2> Reservar recurso </h2></center>
                                <form name="registrarForm" id="registrarForm" action="#" method="post">
                                    <div id="tablaAdmin">
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <label> Información recurso </label>
                                            <tr>
                                                <td> Recurso</td>
                                                <td> <select id="recurso" name="recurso" class="form-control">
                                                        <option> -Seleccione recurso-</option>
                                                        <option> Auditorio </option>
                                                        <option> Piscina </option>
                                                        <option> Cancha </option>
                                                    </select> </td>
                                                <td> Seleccione fecha</td>
                                                <td>
                                                    <input type="text" name="datepicker" id="datepicker"/>
                                                </td>
                                                <td> Seleccione servicios asistenciales: </td>
                                                <td> <input type="checkbox" name="chkMeseros" id="chkMeseros" value="Meseros">Mesería <br>
                                                    <input type="checkbox" name="chkChef" id="chkChef" value="Chef">Chef <br>
                                                    <input type="checkbox" name="chkDecoracion" id="chkDecoracion" value="Decoración">Decoración<br>
                                                    <input type="checkbox" name="chkAnimacion" id="chkAnimacion" value="Animación">Animación<br>
                                                    <input type="checkbox" name="chkSilleteria" id="chkSilleteria" value="Silleteria">Silletería<br>
                                                </td>
                                            </tr>
                                        </table>
                                        <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                            <label> Información del cliente </label>
                                            <tr>
                                                <td>Nombre cliente </td>
                                                <td><input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                <td>Apellido </td>
                                                <td><input type="text" name="txtApellido" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                                <td>N° Documento </td>
                                                <td><input type="text" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control" </td>
                                            </tr><tr>
                                                <td>Nacionalidad </td>
                                                <td><input type="text" name="txtNacionalidad" id="txtNacionalidad" placeholder="Nacionalidad" class="form-control" </td>
                                                <td>Procedencia </td>
                                                <td><input type="text" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control" </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br>
                                    <input type="button" class="btn btn-primary" action="#" value="Registrar" name="registrar" id="registrar"/>
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
    <script src="js/producto.js" type="text/javascript"></script>

<jsp:include page="../plantillas/admin/footer.jsp"/>