<%-- 
    Document   : header
    Created on : 15/10/2015, 09:53:05 PM
    Author     : Javier 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pagina = "panel";

    if (session.getAttribute("pagina") != null) {
        pagina = session.getAttribute("pagina").toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../public/js/jquery-1.11.3.js" type="text/javascript"></script>
        <link href="../public/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>    
        
        <link rel="stylesheet" href="../plantillas/admin/css/AdminLTE.css">
        <link rel="stylesheet" href="../plantillas/admin/css/skin.css">

        <title>SIHYEST</title>
    </head>
    <body class="skin-red sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header">
                <!-- Logo -->
                <a href="#" class="logo">
                    <span class="logo-mini"> <img src="../images/intento2.png" width="40" height="40" /> </span>
                    <span class="logo-lg"><img src="../images/intento2.png" width="40" height="40" /><b>SIHYEST</b></span>
                </a>
                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">

                        <ul class="nav navbar-nav">

                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#">
                                    <i class="fa fa-bell-o"></i>
                                    <input type="hidden" id="input-cantidad" value="" />
                                    <span class="label label-danger" id="cantida-pedidos">0</span>
                                    <audio id="audio">
                                        <source src="#" />
                                    </audio>
                                </a>

                            </li>
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="../images/avatar.png" class="user-image" alt="U">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">Administrador</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="../images/avatar.png" class="img-circle">
                                        <p>
                                            Administrador
                                            <small><%= session.getAttribute("nombre")%></small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="../login/cerrarSesion.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!--Control-->
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                    </div>
                    <!-- search form (Optional) -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->

                    <!-- (Menu vertical izquierda)-->
                   <ul class="sidebar-menu">
                        <li class="header">Menú</li>
                        
                        <li class="treeview <%=((pagina.equals("hospedajes")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-home"></i> <span>Hospedajes</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../hospedajes/registrarHospedaje.jsp"><i class="fa fa-pencil"></i><span>Registrar hospedaje</span></a></li>
                                <li><a href="../hospedajes/consultarHospedaje.jsp"><i class="fa fa-search"></i><span>Consultar hospedajes</span></a></li>
                                <li><a href="../hospedajes/consultarHospedajesActivos.jsp"><i class="fa fa-search"></i><span>Consultar hospedajes activos</span></a></li>
                            </ul>
                        </li>
                         <li class="treeview <%=((pagina.equals("clientes")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-user"></i> <span>Clientes</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../clientes/registrarCliente.jsp"><i class="fa fa-pencil"></i><span>Registrar cliente</span></a></li>
                                <li><a href="../clientes/consultarCliente.jsp"><i class="fa fa-search"></i><span>Consultar cliente</span></a></li>
                            </ul>
                        </li>
                        
                         <li class="treeview <%=((pagina.equals("reservas")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-book"></i> <span>Reservas</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../reservas/habitaciones.jsp"><span>Ver reservas</span></a></li>
                            </ul>
                        </li>  
                        
                        <li class="treeview <%=((pagina.equals("facturas")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-money"></i> <span>Facturas</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../facturas/verHospedajes.jsp"><span>Facturar hospedaje</span></a></li>
                            </ul>
                        </li>   
                        
                        <li class="treeview <%=((pagina.equals("recursos")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-building-o"></i> <span>Recursos</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../recursos/registrarReserva.jsp"><span>Registrar reserva de recurso</span></a></li>
                                <li><a href="../recursos/consultarReservas.jsp"><span>Consultar recursos reservados</span></a></li>
                            </ul>
                        </li> 
                        </ul>

                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">