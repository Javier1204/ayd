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
        <link href="../public/css/font-awesome.css" type="text/css" rel="stylesheet">
        <script src="../public/js/jquery-1.11.3.js" type="text/javascript"></script>
        
        <link href="../public/css/menu.css" type="text/css" rel="stylesheet">

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
            <div class="col-lg-12 col-sm-12 col-xs-12 btn-rojo" style="padding: 0px;">

                <% if (sw) {%>
                <div class="pull-left nom-user">
                    <i class="fa fa-user"></i>  <%=nombre_usuario%>
                </div>
                <% } %>

                <div class="pull-right login">
                    <% if (!sw) { %>
                    <a href="../login/login.jsp" class="noline"><i class="fa fa-key"></i> Iniciar sesión</a>
                    <% } else { %>
                    <a href="../login/cerrarSesion.jsp" class="noline"><i class="fa fa-power-off"></i> Cerrar sesión</a>
                    <% }%>
                </div>               

            </div>
        </div>
        <div class="row" style="height: 30px;"> </div>
        <div class="row bg-blanco">
            <div class="col-lg-12 col-sm-12 col-xs-12">

                <div class="row">
                    <div class="ima">
                        <img src="../images/imagen.jpg" class="img-responsive"/>
                    </div>
                    <div class="col-lg-5 col-sm-5 col-xs-5 info-super">
                        <div class="row">
                            <div class="col-lg-12">
                                <p class="pull-right">
                                    <i class="fa fa-mobile"></i> Línea Gratuita: 01 8000 510 765
                                </p>
                            </div>
                            <div class="col-lg-12">
                                <p class="pull-right">
                                    Bogotá: +57 (1) 628 0000
                                </p>
                            </div>
                                </div>
                            </div>
                        </div>
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
                        <li class="<%=((pagina.equals("index")) ? "active" : " ")%>"><a href="../index.jsp"><i class="fa fa-home"></i> </a></li>
                        <li class="<%=((pagina.equals("nosotros")) ? "active" : " ")%>" ><a href="#">Nosotros</a></li>
                        <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../pedidos/productos.jsp"> Habitaciones</a></li>
                        <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../pedidos/productos.jsp"> Haz tu reserva ¡YA!</a></li>

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

        <div class="msg_add_carro" style="display: none;"><p>Se agregó <span id="num_productos_adds">5</span> Productos</p></div>
