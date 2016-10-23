<%-- 
    Document   : modificarEmpleado
    Created on : 15-oct-2016, 23:44:12
    Author     : FARID SANTIAGO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.EmpleadoDTO"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantillas/adminis/header.jsp"/>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<%
    session.setAttribute("pagina", "empleados");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        String tipo = session.getAttribute("usuario").toString();
        if (!tipo.equals("administrador") || tipo.isEmpty()) {
            response.sendRedirect("../../login/login.jsp");
        } else {
%>

<%
      String cc = request.getParameter("cc");
      Fachada fachada = new Fachada();
      ArrayList<EmpleadoDTO> empleado = fachada.consultarEmpleado("cc", cc);
      for(EmpleadoDTO e: empleado){
%>
<div class="card-panel  white z-depth-5">
    <div class="row">
        <div class="col s12 m12 l12">
            <div id="form_reg_habitacion">
                <form name="modificarFrom" id="modificarFrom" action="javascript:modificarEmpleado()" method="post" class="s12">
                    <div class="row">
                        <i class="material-icons left grey-text">queue</i><h5>Modificar empleado</h5>
                        <li class="divider"></li>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input required id="cc" type="number" min="0" class="validate" value="<%=e.getCc()%>" readonly="true">
                            <label for="cc">Número de identidad</label>
                        </div>
                    </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <input required id="nombre" type="text" class="validate" value="<%=e.getNombres()%>">
                                <label for="nombre">Nombres</label>
                            </div>
                            <div class="input-field col s6">
                                <input required id="apellido" type="text" class="validate" value="<%=e.getApellidos()%>">
                                <label for="apellido">Apellidos</label>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="input-field col s12">
                                <input required id="direccion" type="text" class="validate" value="<%=e.getDireccion()%>">
                                <label for="direccion">Direccion</label> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input required id="tel_fijo" type="tel" class="validate" value="<%=e.getFijo()%>">
                                <label for="tel_fijo">Telefono fijo</label> 
                            </div>
                            <div class="input-field col s6">
                                <input required id="tel_cel" type="tel" class="validate" value="<%=e.getCelular()%>">
                                <label for="tel_cel">Telefono celular</label> 
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <input required id="email" type="email" class="validate" value="<%=e.getEmail()%>">
                                <label for="email">E-Mail</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <select id="niv_estud">
                                    <option value="<%=e.getNivel_estudio()%>" disabled selected><%=e.getNivel_estudio()%></option>
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
                                <input required id="anos_experiencia" name="anos_experiencia" type="number" min="0" class="validate" value="<%=e.getAnio_experiencia()%>">
                                <label for="anos_experiencia">Años de experiencia</label>
                            </div>
                            <div class="input-field col s8">
                                <input required id="cargo" type="text" class="validate" value="<%=e.getCargo()%>">
                                <label for="cargo">Cargo</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <input id="buttoncheck" type="submit" class="waves-effect waves-light btn modal-trigger" href="#modal1" value="Modificar" >

                            </div>
                        </div>
                        <div id="modal1" class="modal">
                            <div id="modificar">

                            </div>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>








<jsp:include page="../plantillas/adminis/footer.jsp"/>
<% }
    }
    }%>
