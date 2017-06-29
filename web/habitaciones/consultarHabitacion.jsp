<%-- 
    Document   : consultarHabitaciones
    Created on : 27/09/2016, 03:01:33 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<div class="card-panel  white z-depth-5" >

    <div class="row">

        <i class="material-icons left grey-text">search</i><h5>Buscar habitacion</h5>
        <li class="divider"></li>

    </div>
    <div class="row">
        <div class=" s12">
            <label for=""> <h5>Ingrese ID habitacion a consultar</h5></label>
        </div>
    </div>
    <nav>
        <div class="nav-wrapper">
            <form>
                <div class="input-field grey darken-2">
                    <input id="buscar_habi" type="search" required>
                    <label for="buscar_habi"><i class="material-icons left">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </form>
        </div>
    </nav>
</div>


<div class="card-panel  white z-depth-5">
    <table class="striped highlight" bgcolor="white">
        <thead>
            <tr class="grey darken-2 white-text">
                <th data-field="id">Id</th>
                <th data-field="tipo">Tipo</th>
                <th data-field="tarifa">Tarifa</th>
                <th data-field="descripcion">Descripcion</th>
                <th data-field="imagen">Imagen</th>
                <th data-field="editar">Ediatr</th>

            </tr>
        </thead>
        <tr>
            <td colspan ="6" ><center>No se encuentran datos con la busqueda digitada</center></td>
        </tr>
    </table>

</div>
<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }} %>