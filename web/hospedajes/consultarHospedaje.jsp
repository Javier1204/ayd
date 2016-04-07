<%-- 
    Document   : consultarHospedaje
    Created on : 02-abr-2016, 11:48:10
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../plantillas/admin/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 30px;">
                            <form name="form1" action="#" method="POST">
                                <center><h1> Consultar Hospedajes </h1></center> <br>
                                <div id="tablaAdmin">
                                    <label> 
                                        Buscar:
                                    </label>  
                                    <div class="input-group">
                                    <input type="text" name="txtBusq" id="txtBusq" placeholder="Search..." class="form-control"/>
                                    <span class="input-group-btn">
                                        <input type="button" name="btnBusq" id="btnBusq" value="Buscar" class="btn btn-flat"/>
                                    </span>
                                    </div>
                                    <br>
                                    <table id="tablaAdmin" class="table table-bordered table-striped">
                                        <thead BGCOLOR="#dc4331">
                                            <tr>
                                                <th> Uno </th>
                                                <th> Dos </th>
                                                <th> Tres </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> Uno </td>
                                                <td> Dos </td>
                                                <td> Tres </td>
                                            </tr>
                                            <tr>
                                                <td> Uno </td>
                                                <td> Dos </td>
                                                <td> Tres </td>
                                            </tr>
                                        </tbody>
                                    </table>
                            </form>
                        </div>
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