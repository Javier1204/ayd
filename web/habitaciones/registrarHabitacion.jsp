<%-- 
    Document   : registrarHabitacion
    Created on : 27/09/2016, 03:01:16 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% session.setAttribute("pagina", "habitaciones");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("administrador") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
%>
<jsp:include page="../plantillas/adminis/header.jsp"/>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<div class="card-panel  white z-depth-5">
    <div class="row">
        <div class="col s12 m12 l12">
            <div id="form_reg_habitacion">
                <form enctype="multipart/form-data" action="javascript:registrarHabitacion()" class="col s12" method="post">
                    <div class="row">

                        <i class="material-icons left grey-text">queue</i><h5>Registar habitacion</h5>
                        <li class="divider"></li>

                    </div>

                    <div class="row">
                        <div class="input-field	col s4" class="validate">
                            <label for="id_hab">ID Habitacion</label>
                            <input type="text" name="id_hab" id="id_hab" class="validate">
                        </div>	
                        <div class="input-field col s4">
                            <select id="tipo" name="tipo" class="validate">
                                <option value="" disabled selected>--Seleccione una opción--</option>
                                <option value="persoanl">Personal</option>
                                <option value="doble">Doble</option>
                                <option value="suite">Suite</option>
                            </select>
                            <label for="tipo">Tipo habitacion</label>
                        </div>
                        <div class="input-field	col s4" class="validate">
                            <label for="tarifa">Tarifa habitacion</label>
                            <input type="number" min="0" name="tarifa" id="tarifa" class="validate">
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="descrip" name="descrip" class="materialize-textarea" length="200"></textarea>
                            <label for="descrip">Descripcion</label>
                        </div>

                    </div>


                    <div class="file-field input-field">
                        <div class="btn grey darken-3">
                            <span>File</span>
                            <input type="file" id="file1" name="file1">
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" id="file1" name="file1">
                        </div>
                    </div>




                    <div class="row">
                        <div class="col s12">
                            <input type="submit" class="waves-effect waves-light btn modal-trigger" href="#modal1" value="Registrar">
                        </div>
                    </div>
                    <div id="modal1" class="modal">
                        <div id="mostrarRegistro">

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>