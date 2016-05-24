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
                                <form name="registrarForm" id="registrarForm" action="javascript:registrarCliente()" method="post">
                                    <div class="form-group">
                                        <legend><i class="fa fa-user"></i> Información del cliente </legend><br>
                                        <center><label id="divCambio"></label></center>
                                        <div class="col-lg-offset-2 col-md-7">
                                            <table class="table table-bordered table-striped">   
                                                <tr>
                                                    <td> <label>Documento</label></td>
                                                    <td><input type="text" name="txtDocumento" required id="txtDocumento" placeholder="Documento" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Nombre cliente</label></td>
                                                    <td><input type="text" name="txtNombre" required id="txtNombre" placeholder="Nombre cliente" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Apellido cliente</label></td>
                                                    <td><input type="text" name="txtApellido" required id="txtApellido" placeholder="Apellido cliente" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Teléfono</label></td>
                                                    <td> <input type="phone" name="txtTelefono" id="txtTelefono" required placeholder="Telefono" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td> <label>e-mail</label></td>
                                                    <td><input type="email" name="txtEmail" id="txtEmail" required placeholder="e-mail" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Procedencia</label></td>
                                                    <td><input type="ext" name="txtProcedencia" id="txtProcedencia" required placeholder="procedencia" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input type="submit" class="btn btn-primary" value="Registrar" name="registrar" id="registrar"/> </td>
                                                </tr>                
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