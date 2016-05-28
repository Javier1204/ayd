<%-- 
    Document   : modificarCliente
    Created on : 02-abr-2016, 11:47:16
    Author     : Javier
--%>

<%@page import="dto.ClienteDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Fachada fachada = new Fachada();
    String id = request.getParameter("id_cliente");
    ClienteDTO c = fachada.consultarCliente(id);
%>
<jsp:include page="../plantillas/admin/header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 30px;">
                                <center><h2> Modificar cliente </h2></center>
                                <form name="registrarForm" id="registrarForm" action="javascript:modificarCliente()" method="post">
                                    <div class="form-group">
                                        <legend><i class="fa fa-user"></i> Información del cliente </legend><br>
                                        <center><label id="divCambio"></label></center>
                                        <div class="col-lg-offset-2 col-md-7">
                                            <table class="table table-bordered table-striped">   
                                                <tr>
                                                    <td> <label>Documento</label></td>
                                                    <td><input type="text" name="txtDocumento" value="<%=c.getId_cliente()%>" readonly="true" required id="txtDocumento" placeholder="Documento" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Nombre cliente</label></td>
                                                    <td><input type="text" name="txtNombre" value="<%=c.getNombre_cliente()%>" required id="txtNombre" placeholder="Nombre cliente" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Apellido cliente</label></td>
                                                    <td><input type="text" name="txtApellido" value="<%=c.getApellido()%>" required id="txtApellido" placeholder="Apellido cliente" class="form-control" />     </td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Teléfono</label></td>
                                                    <td> <input type="phone" name="txtTelefono" value="<%=c.getTelefono()%>" id="txtTelefono" required placeholder="Telefono" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td> <label>e-mail</label></td>
                                                    <td><input type="email" name="txtEmail" id="txtEmail" value="<%=c.getEmail()%>" required placeholder="e-mail" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td> <label>Procedencia</label></td>
                                                    <td><input type="ext" name="txtProcedencia" value="<%=c.getProcedencia()%>" id="txtProcedencia" required placeholder="procedencia" class="form-control" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input type="submit" class="btn btn-primary" value="Modificar" name="modificar" id="modificar"/> </td>
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