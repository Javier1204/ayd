<%-- 
    Document   : header
    Created on : 17/10/2015, 11:30:57 AM
    Author     : freddhy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String nombre_usuario = "";
    String pagina = "";
    boolean sw = false;

    if ((session != null)) {

        if (session.getAttribute("nombre") != null) {
            nombre_usuario = session.getAttribute("nombre").toString();
            sw = true;
        }
        if (session.getAttribute("pagina") != null) {
            pagina = session.getAttribute("pagina").toString();
        }

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../public/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="../plantillas/usuario/css/usuario.css" type="text/css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
        <script src="../public/js/jquery-1.11.3.js" type="text/javascript"></script>
        <script src="../public/css/general.css" type="text/css" rel="stylesheet"></script>
        <title>Hotel DAYAMAR</title>
        <script type="text/javascript">

            $(document).ready(function () {

                var dispositivo = navigator.userAgent.toLowerCase();
                if (dispositivo.search(/iphone|ipod|ipad|android|phone|blackberry|meego|blazer|compal|elaine|fennec|hiptop|iemobile/) > -1) {
                    $("div.contenedor-img").each(function (index)
                    {
                        $(this).removeClass("ejemplo-1");

                    })
                }

            });

        </script>
    </head>
    <body>
        <div class="row top_bar">
            <div class="col-lg-12 col-sm-12 col-xs-12 bg-azul" style="padding: 0px;">s
                <div class="pull-left nom-user">
                    <i class="fa fa-bell"></i>SIHYEST
                </div>
                <div class="pull-right login">
                    <a href="../login/login.jsp" class="noline"><i class="fa fa-key"></i> Iniciar sesión</a>
                </div>               
            </div>
        </div>

        <div class="row" style="height: 30px;"> </div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img src="../public/img/vacacional.jpg" width="100%" height="200" alt="First slide">
                    <div class="carousel-caption">
                        <h1>SIHYEST</h1>
                        <p1>Sistema de información para hoteles y establecimientos turísticos</p1>
                        <p2 class="pull-right" class="info-hotel">
                            <i class="fa fa-mobile"></i> Línea Gratuita: 01 8000 510 765
                        </p2>
                        <p2 class="pull-right" class="info-hotel">
                            Bogotá: +57 (1) 628 0000
                        </p2>
                    </div>
            </div>
        </div>
    </div>


    <!--SECCION DE BARRA DE MENU-->
    <nav class="navbar navbar-default" role="navigation">
        <!-- El logotipo y el icono que despliega el menú se agrupan
             para mostrarlos mejor en los dispositivos móviles -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                <span class="sr-only">Desplegar navegación</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="barra-menu">
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="<%=((pagina.equals("inicio")) ? "active" : " ")%>" ><a href="../index/index.jsp"><i class="fa fa-home"></i>Inicio</a></li>
                    <li class="<%=((pagina.equals("nosotros")) ? "active" : " ")%>" ><a href="../reservas/nosotros.jsp">Nosotros</a></li>
                    <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../reservas/habitaciones.jsp"> Habitaciones</a></li>
                    <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../reservas/realizarReserva.jsp"> Haz tu reserva ¡YA!</a></li>
                    <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../reservas/opiniones.jsp"> Opiniones</a></li>

                </ul>

                <form class="navbar-form navbar-right form-busqueda" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Buscar">
                    </div>
                    <button type="submit" class="btn btn-rojo"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
    </nav><!--FIN BARRA DE MENU-->
