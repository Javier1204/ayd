<%-- 
    Document   : header
    Created on : 27/09/2016, 04:37:19 PM
    Author     : tuto2
--%>

<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>

        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../materialize/css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script type="text/javascript" src="../materialize/js/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="../materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script language="javascript">

            $(document).ready(function () {


                $('select').material_select();
                $(".button-collapse").sideNav();
                $('.collapsible').collapsible();
                $('.button-collapse').sideNav({
                Materialize.fadeInImage('#profilepic');
                        Materialize.showStaggeredList('#staggered-list');


            });




        </script> 
        <title>SIHYEST</title>
    </head>

    <body >



        <header>
            <nav class="top-nav  grey darken-3">
                <div class="container">
                    <div class="container">
                        <div class="nav-wrapper"><a class="page-title">SIHYEST</a></div>
                    </div>
                </div>



            </nav>

            <div class="container"><a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only"><i class="material-icons">Menu</i></a></div>

            <ul id="nav-mobile" class="side-nav fixed grey darken-2">
                <div class="row">
                    <div class="col s12 white-text">
                        
                        <center><img src="../images/logo_blanco.png" width="50" height="50" /></center>
                    </div>
                </div>

                    <div class="grey darken-2">
                        <li><a class="subheader"><i class="material-icons">view_agenda</i>MENU</a></li>
                    </div>
                    <li><div class="divider"></div></li>
                    <li class="bold"><a href="#!"><i class="material-icons">business</i> <span class="white-text">Habitaciones</span></a></li>
                    <li class="bold"><a href="#!"><i class="material-icons">assignment_ind</i> <span class="white-text">Empleados</span></a></li>
                    <li class="bold"><a href="#!"><i class="material-icons">assignment</i> <span class="white-text">Nosotros</span></a></li>
                </div>
            </ul>
        </header>




        <%--
                <div class="row">

            <div class="col s2">
                <div class="card-panel grey darken-2">
                    <div class="card-panel grey darken-3">
                        <li><a class="subheader"><i class="material-icons">view_agenda</i>MENU</a></li>
                    </div>
                    <li><div class="divider"></div></li>
                    <li><a href="#!"><i class="material-icons">business</i> <span class="white-text">Habitaciones</span></a></li>
                    <li><a href="#!"><i class="material-icons">assignment_ind</i> <span class="white-text">Empleados</span></a></li>
                    <li><a href="#!"><i class="material-icons">assignment</i> <span class="white-text">Nosotros</span></a></li>
                </div>
            </div>
        --%>
        <div class="col s9">
            <!-- Teal page content  -->


