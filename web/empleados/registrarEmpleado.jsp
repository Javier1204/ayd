<%-- 
    Document   : registrarEmpleado
    Created on : 15-oct-2016, 23:43:38
    Author     : FARID SANTIAGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("pagina", "empleados");
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
<script type="text/javascript">
    $(document).ready(function () {


        $('#seleccion').click(function() {
            
            var var_name = $("input[name='group1']:checked").val();
            $('#genero').val(var_name);
            
        });
    });
</script>
<div class="card-panel  white z-depth-5">
    <div class="row">
        <div class="col s12 m12 l12">
            <div id="form_reg_habitacion">
                <form name="registrarForm" id="registrarForm" action="javascript:registrarEmpleado()" method="post" class="s12">
                    <div class="row">
                        <i class="material-icons left grey-text">queue</i><h5>Registar empleado</h5>
                        <li class="divider"></li>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input required id="cc" type="number" min="0" class="validate">
                            <label for="cc">Número de identidad</label>
                        </div>
                    </div>
                    <div class="row" id="seleccion">
                        <div class="input-field col s3">

                            <label>Genero</label> 
                        </div>
                        <div class="input-field col s3">
                            <p>
                                <input id="masculino" name="group1" type="radio" value="masculino" >
                                <label for="masculino">Masculino</label>
                            </p> 
                        </div>
                        <div class="input-field col s4">
                            <p>
                                <input id="femenino" name="group1" type="radio" value="femenino"  >
                                <label for="femenino">Femenino</label>
                            </p> 
                        </div>
                        <input hidden="true" name="genero" id="genero" type="text" value="es" class="validate">
                        <br><br><br><br><br>
                    </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <input required id="nombre" type="text" class="validate">
                                <label for="nombre">Nombres</label>
                            </div>
                            <div class="input-field col s6">
                                <input required id="apellido" type="text" class="validate">
                                <label for="apellido">Apellidos</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s8">
                                <input required id="lugar_nac" type="text" class="validate">
                                <label for="lugar_nac">Lugar nacimiento</label>
                            </div>
                            <div class="input-field col s4">
                                <label for="fecha_nac">Fecha nacimiento</label>
                                <input required id ="fecha_nac"type="text" class="datepicker">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input required id="direccion" type="text" class="validate">
                                <label for="direccion">Direccion</label> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input required id="tel_fijo" type="tel" class="validate">
                                <label for="tel_fijo">Telefono fijo</label> 
                            </div>
                            <div class="input-field col s6">
                                <input required id="tel_cel" type="tel" class="validate">
                                <label for="tel_cel">Telefono celular</label> 
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <input required id="email" type="email" class="validate">
                                <label for="email">E-Mail</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <select id="niv_estud">
                                    <option value="" disabled selected>--Seleccione una opción--</option>
                                    <option value="primaria">Primaria</option>
                                    <option value="bachiller">Bachiller</option>
                                    <option value="tecnica">Tecnica</option>
                                    <option value="profesional">Profesional</option>
                                    <option value="postgrado">Postgrado</option>
                                    <option value="otros">Otros</option>
                                </select>
                                <label for="niv_estud">Nivel de estudio</label>
                            </div>
                        </div>
                        <div class="row">  
                            <div class="input-field col s4">
                                <input required id="anos_experiencia" name="anos_experiencia" type="number" min="0" class="validate">
                                <label for="anos_experiencia">Años de experiencia</label>
                            </div>
                            <div class="input-field col s8">
                                <input required id="cargo" type="text" class="validate">
                                <label for="cargo">Cargo</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <input id="buttoncheck" type="submit" class="waves-effect waves-light btn modal-trigger" href="#modal1" value="Registrar" >

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