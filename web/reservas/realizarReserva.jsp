
<%-- 
    Document   : realizarReserva
    Created on : 02-abr-2016, 11:51:24
    Author     : Javier
--%>

<jsp:include page="../plantillas/usuario/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 30px;">
                                <center><h2> Reserva </h2>
                                    <label id="divResultado">  </label></center>
                                <form name="registrarForm" id="registrarForm" action="javascript:registrarReserva()" method="POST">
                                    <div id="tablaAdmin">
                                        <div id="divCambio">
                                            <table id="tablaAdmin" class="table table-bordered table-striped">
                                                <legend><i class="fa fa-book"></i> Informaci?n de Reserva </legend>
                                                <tr>
                                                    <td>Cantidad personas </td>
                                                    <td><input required type="number" name="txtCantPer" id="txtCantPer" placeholder="Cantidad de personas" onchange="javascript:validarCampoFecha()" class="form-control"></td>
                                                    <td>Fecha Entrada</td>
                                                    <td> <input required type="text" name="from" id="from" placeholder="Fecha Entrada" class="form-control"> </td>
                                                    <td>Fecha Salida</td>
                                                    <td> <input required type="text" name="to" id="to" placeholder="Fecha Salida" class="form-control" onchange="javascript:validarCampoPersonas()"> </td>
                                                </tr>
                                            </table>  
                                            <table id="tablaAdmin" class="table table-bordered table-striped"> 
                                                <legend><i class="fa fa-user"></i> Informaci?n del Cliente </legend>
                                                <tr> 
                                                    <td>N? Documento </td>
                                                    <td><input required type="text" name="txtDocumento" id="txtDocumento" placeholder="Documento cliente" class="form-control"> </td>
                                                    <td>Nombre cliente</td>
                                                    <td><input required type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de usuario" class="form-control"></td>
                                                    <td>Apellido </td>
                                                    <td><input required type="text" name="txtApellido" id="txtApellido" placeholder="Apellido usuario" class="form-control"></td>
                                                </tr><tr>
                                                    <td>Telefono </td>
                                                    <td><input required type="tel" name="txtTelefono" id="txtTelefono" placeholder="Telefono" class="form-control"> </td>
                                                    <td>E-mail</td>
                                                    <td><input required type="email" name="txtEmail" id="txtEmail" placeholder="e-mail" class="form-control"></td>
                                                    <td>Procedencia </td>
                                                    <td><input required type="text" name="txtProcedencia" id="txtProcedencia" placeholder="Procedencia" class="form-control"> </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div><legend><i class="fa fa-home"></i> Informaci?n de la Habitaci?n </legend></div>
                                        <div id="cargar" style="float:left">
                                            <table id="tablaAdmin" class="table table-bordered table-striped">
                                                <tr>
                                                    <td> Habitaci?n</td>
                                                    <td> <select required id="habitacion" name="habitacion" onchange="javascript:cargarDescripcion(this)" class="form-control">
                                                            <option value=""> -No selection-</option>
                                                        </select> </td>
                                                </tr>
                                                <tr> </tr>
                                            </table>
                                        </div>
                                        <div id="descripcion" style="float:left">
                                            <table id="tablaAdmin" class="table table-bordered table-striped">
                                                <tr>
                                                    <td> Descripci?n habitaci?n</td>
                                                    <td> <textarea type="text" name="txtDescripcion" id="txtDescripcion" class="form-control"></textarea> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <table id="tablaAdmin" class="table table-bordered table-striped">
                                        <tr><td> </td></tr>
                                    </table>
                                    <input type="submit" class="btn btn-primary" value="Registrar" name="registrar" id="registrar"/> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/procesar.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
    <script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>  
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script>
        $(function () {
            $("#from").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
                });
            $("#to").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
                });
        });
    </script>
<jsp:include page="../plantillas/usuario/footer.jsp"></jsp:include>

