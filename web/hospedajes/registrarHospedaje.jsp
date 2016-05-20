<%-- 
    Document   : registrarHospedaje
    Created on : 02-abr-2016, 11:47:52
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
                                <center><h2> Registrar hospedaje </h2></center>
                                <form name="registrarForm" id="registrarForm" action="#" method="post">
                                    <div id="tablaAdmin">
                                        <div id="divCambio">
                                            <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                                <label><i class="fa fa-user"></i> Información del cliente </label>
                                                <tr> 
                                                    <td>N° Documento </td>
                                                    <td><input type="text" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control" onchange="javascript:validarCliente()"> </td>
                                                    <td>Nombre cliente</td>
                                                    <td><input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                    <td>Apellido </td>
                                                    <td><input type="text" name="txtApellido" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                                </tr><tr>
                                                    <td>Telefono </td>
                                                    <td><input type="tel" name="txtTelefono" id="txtTelefono" placeholder="Telefono" class="form-control"> </td>
                                                    <td>Procedencia </td>
                                                    <td><input type="text" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control"> </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table id="tablaAdmin" class="table table-bordered table-striped">
                                            <label><i class="fa fa-hotel"></i> Información hospedaje </label>
                                            <tr>
                                                <td>Cantidad personas </td>
                                                <td><input type="number" name="txtCantPer" id="txtCantPer" placeholder="Cantidad de personas" onchange="javascript:validarCampoFecha()" class="form-control"></td>
                                                <td> Fecha salida</td>
                                                <td> <input type="date" name="txtFecha_salida" id="txtFecha_salida" placeholder="Fecha salida" class="form-control" onchange="javascript:validarCampoPersonas()"> </td>
                                            </tr>
                                        </table>  
                                        <div><label> Información habitación </label></div>
                                        <div id="cargar" style="float:left">
                                            <table id="tablaAdmin" class="table table-bordered table-striped">
                                                <tr>
                                                    <td> Habitación</td>
                                                    <td> <select id="habitacion" name="habitacion" class="form-control">
                                                            <option value=""> -No selection-</option>
                                                        </select> </td>
                                                </tr>
                                                <tr> </tr>
                                            </table>
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
                                        <tr><td> <input type="submit" class="btn btn-primary" value="Registrar" name="registrar" id="registrar"/> </td></tr>
                                    </table>
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