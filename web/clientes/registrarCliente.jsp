<%-- 
    Document   : registrarCliente
    Created on : 02-abr-2016, 11:47:00
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../plantillas/recepcionista/header.jsp"></jsp:include>

    <div class="card-panel  white z-depth-5">
        <div class="row">
            <div class="col s12 m12 l12">
                <div id="form_reg_habitacion">
                    <form name="registrarForm" id="registrarForm" action="javascript:registrarCliente()" method="post" class="s12">
                        <div class="row">
                            <i class="material-icons left grey-text">queue</i><h5>Registar cliente</h5>
                            <li class="divider"></li>
                        </div>
                        <div class="row">
                            <div class="s12" id="divCambio">
                                <legend><i class="material-icons left grey-text">perm_identity</i> Información del cliente </legend>
                                <li class="divider"></li>
                            </div>
                        </div>
                        <div class="container ">
                            <div class="row">

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtDocuemnto">Documento cliente</label>
                                    <input type="text" name="txtDocumento" id="txtDocumento" class="validate" onchange="javascript:validarCliente()">
                                </div>

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtNombre">Nombres cliente</label>
                                    <input type="text" name="txtNombre" id="txtNombre" class="validate" >
                                </div>

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtApellido">Apellidos cliente</label>
                                    <input type="text" name="txtApellido" id="txtApellido" class="validate" >
                                </div>

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtTelefono">Telefono cliente</label>
                                    <input type="tel" name="txtTelefono" id="txtTelefono" class="validate" >
                                </div>

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtEmail">Email cliente</label>
                                    <input type="email" name="txtEmail" id="txtEmail" class="validate" >
                                </div>

                                <div class="input-field	col s6" class="validate">
                                    <label for="txtProcedencia">Procedencia cliente</label>
                                    <input type="text" name="txtProcedencia" id="txtProcedencia" class="validate" >
                                </div>
                            </div>  




                            <div class="row">
                                <div class="col s12">
                                    <input type="submit" class="btn center-align grey darken-3 right" value="Registrar" name="registrar" id="registrar">
                                </div>
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
    <script src="js/procesar.js" type="text/javascript"></script>


<jsp:include page="../plantillas/recepcionista/footer.jsp"/>