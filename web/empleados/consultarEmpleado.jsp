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
<script type="text/javascript">
    $(document).ready(function () {


        $('#radios').click(function() {
            
            var var_name = $("input[name='group2']:checked").val();
            $('#tipo').val(var_name);
            
        });
        
        
    });
</script>
<jsp:include page="../plantillas/adminis/header.jsp"/>

<div class="card-panel  white z-depth-5" >

    <div class="row">

        <i class="material-icons left grey-text">search</i><h5>Consultar empleados</h5>
        <li class="divider"></li>

    </div>

    <div class="row" id="radios">
        <div class="input-field col s4">

            <label for=""><h5>Buscar por</h5></label> 
        </div>
        <div class="input-field col s4">
            <p>
                <input name="group2" type="radio" id="nombre_contacto" value="nombre"/>
                <label for="nombre_contacto">Nombre de empleado</label>
            </p> 
        </div>
        <div class="input-field col s4">
            <p>
                <input name="group2" type="radio" id="cedula" value="cc"/>
                <label for="cedula">Cedula del empleado</label>
            </p> 
        </div>

    </div>
    <input hidden="true" id="tipo" name="tipo"/>

    <nav>
        <div class="nav-wrapper">
            <form name="busq" id="busq" action="javascript:consultarContacto()" method="post">
                <div class="input-field grey darken-2">
                    <input id="buscar_contacto" type="search" required>
                    <label for="buscar_contacto"><i class="material-icons left">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </form>
            <script>
                $(document).ready(function ()) {
                    $("#busq").addEventListener('keypress', function (event) {
                        if (event.keyCode === 13) {
                            event.preventDefault();
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
                <th data-field="nombre">Cedula</th>
                <th data-field="apellido">Nombre</th>
                <th data-field="cedula">Apellido</th>
                <th data-field="direccion">Direccion</th>
                <th data-field="ciudad">Celular</th>
                <th data-field="telefono">Fijo</th>
                <th data-field="email">E-mail</th>
                <th data-field="experiencia">Experiencia</th>
                <th data-field="cargo">Cargo</th>
                <th data-field="editar">Editar</th>

            </tr>
        </thead>
        <tr>
            <td colspan ="10" ><center>No se encuentran datos con la busqueda digitada</center></td>
        </tr>
    </table>
</div>
<br></br>




<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }%>