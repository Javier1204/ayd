<%-- 
    Document   : registrarCliente
    Created on : 02-abr-2016, 11:47:00
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
                                <center><h2> Registrar cliente </h2></center>
                                <form name="registrarForm" id="registrarForm" action="#" method="post">
                                    <div id="tablaAdmin">
                                        <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                            <label> Información del cliente </label>
                                            <tr>
                                                <td>Nombre cliente </td>
                                                <td><input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de cliente" class="form-control"></td>
                                                <td>Apellido </td>
                                                <td><input type="text" name="txtApellido" id="txtApellido" placeholder="Apellido cliente" class="form-control"></td>
                                                <td>N° Documento </td>
                                                <td><input type="text" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control"</td>
                                            </tr>
                                            <tr>
                                               <td>Sexo</td>
                                                <td><input type="text" name="txtSexo" id="txtSexo" placeholder="Sexo" class="form-control"></td>
                                                <td>Edad </td>
                                                <td><input type="number" name="txtEdad" id="txtEdad" placeholder="Edad" class="form-control"></td>
                                                <td>Campo no sé qué poner </td>
                                                <td><input type="text" name="txtDocumento" id="txtDocumento" placeholder="Adulto" class="form-control"</td> 
                                            </tr>
                                            <tr>
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