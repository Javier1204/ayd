<%-- 
    Document   : modificarMision
    Created on : 15-oct-2016, 23:46:58
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% session.setAttribute("pagina", "informacion");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("administrador") || tipo.isEmpty()) {
            response.sendRedirect("../login/login.jsp");
        } else {
%>

<jsp:include page="../plantillas/adminis/header.jsp"/>

<%
            Fachada fachada = new Fachada();
            String mision = fachada.mostrarMision();
%>

<div class="card-panel  white z-depth-5">
    <div class="row">
        <div class="col s12 m12 l12">
            <div id="form mod_mision">
                <form name="formInfo" id="formInfo" action="javascript:modificarMision()" class="col s12" method="post">
                    <div class="row">

                        <i class="material-icons left grey-text">queue</i><h5>Modificar misión</h5>
                        <li class="divider"></li>

                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="input-field col s12">
                                <textarea id="textareaMision" class="materialize-textarea"><%=mision%></textarea>
                                <label for="textarea1">Actualizar misión</label>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="waves-effect waves-light btn modal-trigger" name="btnMision" href="#modal1" id="btnMision" value="Actualizar"/>
                    <div id="modal1" class="modal">
                        <div id="actualizarMision">

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>

<jsp:include page="../plantillas/adminis/footer.jsp"/>
<%}
                        }%>