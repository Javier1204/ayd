<%-- 
    Document   : habitaciones
    Created on : 02-abr-2016, 11:51:32
    Author     : Javier
--%>

<%@page import="dto.HabitacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Fachada fachada = new Fachada();
    ArrayList<HabitacionDTO> habitaciones = fachada.obtenerHabitaciones();
%>

<jsp:include page="../plantillas/usuario/header.jsp"/>
<div class="container">
    <div class="row">
        <center><h1>Habitaciones </h1> </center>
        <div class="row">
            <div class="col-lg-12 col-md-12 sp-col"> 
                <div style="text-align: justify" class="textinicio">
                   Las habitaciones del Hotel  ofrecen todos los servicios necesarios 
                   para brindarle el máximo confort en su estadía: escritorio, sala de recibo, TV LCD, telefonía digital, 
                   wifi, aire acondicionado... Lugares llenos de quietud y encanto rodeados por piscinas y un hermoso jardín
                   tropical que le permiten disfrutar desde que amanece del resplandor de la naturaleza…
                </div>
            </div>
        </div>
        <%  for (HabitacionDTO h : habitaciones) {%>
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="#">
                <div class="contenedor-img ejemplo-1">  
                    <img src="<%=h.getUrl_imagen()%>" alt="Imagen" class="img-responsive img-rounded"/>
                    <div class="mascara"></div>
                    <div class="contenido">
                        <h2>Habitación <%=h.getId()%></h2>  
                        <a href="#" class="link">Ver habitaciones</a>
                    </div>
                </div>
            </a>
        </div>
        <% }%>
    </div>
</div>

<jsp:include page="../plantillas/usuario/footer.jsp"/>
