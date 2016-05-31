<%-- 
    Document   : index
    Created on : 07-abr-2016, 14:17:01
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../plantillas/usuario/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 sp-col">
            <center><h1>Bienvenido a Cúcuta!</h1></center>  
            <div style="text-align: justify" class="textinicio">
                El Hotel  es un acogedor hotel en Cúcuta, cerca de la frontera entre Colombia
                y Venezuela, rodeado de naturaleza y hermosos jardines con piscinas en los que disfrutará de unas
                relajantes vacaciones en pareja, con los niños o entre amigos.
            </div>
        </div>
    </div>
    <div class="row" style="height: 30px;"> </div>
    <div class="container">
    <div class="row">
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="#">
                <div class="contenedor-img ejemplo-1">  
                    <img src="../public/img/puente.jpg" alt="Imagen" class="img-responsive img-rounded"/>
                    <div class="mascara"></div>
                    <div class="contenido">
                        <h2>Conoce a Cúcuta!</h2>  
                        <a href="../reservas/habitaciones.jsp" class="link">Ver habitaciones</a>
                    </div>
                </div>
            </a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-6 sp-col">
                    <a href="#">
                        <div class="contenedor-img ejemplo-1">  
                            <img src="../public/img/cucuta.jpg" alt="Imagen" class="img-responsive img-rounded"/>
                            <div class="mascara"></div>
                            <div class="contenido">
                                <h2>Su belleza</h2>  
                                <a href="../reservas/habitaciones.jsp" class="link">Ver habitaciones</a>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 sp-col">
                            <div class="contenedor-img ejemplo-1">  
                                <img src="../public/img/cucuta1.jpg" alt="Imagen" class="img-responsive img-rounded"/>
                                <div class="mascara"></div>
                                <div class="contenido">
                                    <h2>Su historia</h2>  
                                    <a href="../reservas/habitaciones.jsp" class="link">Ver habitaciones</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container marketing">
            <div class="row" style="height: 30px;"> </div>
            <!-- Three columns of text below the carousel -->
            <center><div class="row">
                    <div class="col-lg-4 col-sm-6 sp-col">
                        <img class="img-circle" src="../public/img/descarga.gif" alt="Generic placeholder image" width="100" height="100">
                        <h2>Servicios</h2>
                        <p>Los servicios del hotel son el complemento ideal para disfrutar de unos días de relax, de un evento o de 
                            una reunión de negocios en Cúcuta. Disfrute de gastronomía típica, zona de juegos, 2 piscinas de adultos y 
                            1 para niños, salas de conferencias, recepción 24 hs… </p>
                        <p><a class="btn btn-info" href="../reservas/habitaciones.jsp" role="button">Ver</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4 col-sm-6 sp-col">
                        <img class="img-circle" src="../public/img/descarga.gif" alt="Generic placeholder image" width="100" height="100">
                        <h2>Ofertas</h2>
                        <p>Conozca todas las ofertas y promociones del Hotel y obtenga increíbles descuentos. 
                            Solo aquí, en la web oficial del Hotel encontrará todas las ofertas de este hotel 
                            4 estrellas en Cúcuta, y podrá conseguir el mejor precio online y máximas garantías.</p>
                        <p><a class="btn btn-info" href="../reservas/realizarReserva.jsp" role="button">Ver</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4 col-sm-6 sp-col">
                        <img class="img-circle" src="../public/img/descarga.gif" alt="Generic placeholder image" width="100" height="100">
                        <h2>Opiniones</h2>
                        <p>Revise las críticas y opiniones del Hotel  desde aquí: en la sección de 'Opina' encontrará todas las 
                            opiniones y comentarios de este hotel campestre en Cúcuta, las recomendaciones de otros viajeros sobre el 
                            hotel y sus consejos para disfrutar de la mejor estancia en Cúcuta, Colombia. Todo, en la web oficial del Hotel </p>
                        <p><a class="btn btn-info" href="../reservas/opiniones.jsp" role="button">Ver</a></p>
                    </div><!-- /.col-lg-4 -->
                </div> </center><!-- /.row -->

        </div>
        <hr class="featurette-divider">   
        <div class="row" style="height: 30px;"> </div>
        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">SIHYEST. <span class="text-muted">Universidad Francisco de Paula Santader</span></h2>
                <p class="lead"> SIHYEST nace a raíz del proyecto académico para la materia Análisis y diseño con la dirección de 
                    la Ing. Judith del Pilar Rodríguez. Ofrece servicios para la gestión administrativa de hoteles en los 
                    procesos de hospedajes, recursos y reservas.</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-responsive center-block" src="../public/img/images.jpg" alt="Generic placeholder image">
            </div>
        </div>

        <hr class="featurette-divider">

    </div>
</div>




<jsp:include page="../plantillas/usuario/footer.jsp"/>