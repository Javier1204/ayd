<%-- 
    Document   : consultarEMpleado
    Created on : 15-oct-2016, 23:44:24
    Author     : FARID SANTIAGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/js.js"></script>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
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
<script lenguaje="javascript">
    $(document).ready(function () {

        $('#radios4').click(function() {
            var var_name = $("input[name=group4]:checked").val();
            $('#tipo').val(var_name);
            
        });
        
        
    });
</script>
<div class="card-panel  white z-depth-5" >

    <div class="row" id="radios4">
        <i class="material-icons left grey-text">search</i><h5>Consultar empleados</h5>
        <li class="divider"></li>
        
        <div class="input-field col s4">

            <label for=""><h5>Buscar por</h5></label> 
        </div>
        <div class="input-field col s4">
            <p>
                <input name="group4" type="radio" id="nombre_empleado" value="nombre"/>
                <label for="nombre_empleado">Nombre de empleado</label>
            </p> 
        </div>
        <div class="input-field col s4">
            <p>
                <input name="group4" type="radio" id="cedula" value="cc"/>
                <label for="cedula">Cedula del empleado</label>
            </p> 
        </div>

    </div>
    <input hidden="true" id="tipo" name="tipo"/>

    <nav>
        <div class="nav-wrapper">
            <form name="busq" id="busq" action="javascript:consultarEmpleado()" method="post">
                <div class="input-field grey darken-2">
                    <input id="buscar_empleado" type="search" required>
                    <label for="buscar_empleado"><i class="material-icons left">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </form>
            <script>
                $(document).ready(function () {
                    $("#buscar_empleado").on('keypress', function (event) {
                        if (event.keyCode === 13) {
                            event.preventDefault();
                            consultarEmpleado();
                        }
                    });
                });
            </script>
        </div>
    </nav>
</div>

<div id="tablaF" class="card-panel  white z-depth-5">
    <table class="striped highlight" bgcolor="white">
        <thead>
            <tr class="grey darken-2 white-text">
                <th data-field="cedula">Cedula</th>
                <th data-field="nombre">Nombre</th>
                <th data-field="apellido">Apellido</th>
                <th data-field="direccion">Direccion</th>
                <th data-field="celular">Celular</th>
                <th data-field="email">E-mail</th>
                <th data-field="experiencia">Años Experiencia</th>
                <th data-field="cargo">Cargo</th>
                <th data-field="editar">Editar</th>

            </tr>
        </thead>
        <tr>
            <td colspan ="9" ><center>No se encuentran datos con la busqueda digitada</center></td>
        </tr>
    </table>
</div>
<br></br>




<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>