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





                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15, // Creates a dropdown of 15 years to control year
                    format: 'yyyy-mm-dd',
                    labelMonthNext: 'Mes siguiente',
                    labelMonthPrev: 'Mes anterior',
                    labelMonthSelect: 'Seleccionar mes',
                    labelYearSelect: 'Seleccionar año',
                    monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                    weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
                    weekdaysShort: ['Dom', 'Lun', 'Mts', 'Mie', 'Jue', 'Vie', 'Sab'],
                    weekdaysLetter: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
                    today: 'Hoy',
                    clear: 'Limpiar',
                    close: 'Cerrar'
                });

                $('select').material_select();

                $(".button-collapse").sideNav();
                $(document).on('change', function (e) {
                    $('select').material_select();
                });
                $('select').on('contentChanged', function () {
                    // re-initialize (update)
                    $(this).material_select();
                });
                $('input#input_text, textarea#descrip').characterCounter();


            });




        </script> 
        <title>SIHYEST</title>
    </head>



    <body background="../images/fondo_sc.jpg">


        <header>
            <div class="imagen" style="width:100%;" style="position: relative; display:block; overflow: hidden; margin: auto;"> 
                <a href="#">
                    <img src="../images/banner_sihyest.jpg" alt="" style="max-width:100%;" alt='' >
                </a>
                <%--
              <a href="../index.jsp">
                
                  <img src="../images/logout.png" title='Cerrar sesion'style='position:absolute; top:35px; right:230px; width: 40px' title='HOJAS' alt=''/>
              </a>
                --%>
            </div>
            <div class="container">
                <ul id="dropdown1" class="dropdown-content grey darken-4" >
                    <li><a href="../habitaciones/registrarHabitacion.jsp"><i class="tiny material-icons white-text">library_add</i><span class="white-text" >Registrar</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../habitaciones/consultarHabitacion.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Cosultar</span></a></li>

                </ul>

                <ul id="dropdown2" class="dropdown-content grey darken-4" >
                    <li><a href="../empleados/registrarEmpleado.jsp"><i class="tiny material-icons white-text">library_add</i><span class="white-text" >Registrar</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../consultar/consultarEmpleado.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Cosultar</span></a></li>
                </ul>

                <ul id="dropdown3" class="dropdown-content grey darken-4" >
                    <li><a href="../hotel/mision.jsp"><i class="tiny material-icons white-text">settings_backup_restore</i><span class="white-text" >Actualizar mision</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../hotel/vision.jsp"><i class="tiny material-icons white-text">settings_backup_restore</i><span class="white-text" >Actualizar vision</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../hotel/informacion.jsp"><i class="tiny material-icons white-text">store</i><span class="white-text" >Actualizar informacion hotel</span></a></li>
                </ul>



                <nav>

                    <div class="nav-wrapper grey darken-3">

                        <a href="../inicio/principal.jsp" class="brand-logo thin right" >ADMINISTRADOR<i class="material-icons left"></i></a>
                        <ul class="left hide-on-med-and-down"> 

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Habitaciones
                                    <i class="material-icons right">loyalty</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown2">Empleados
                                    <i class="material-icons right">perm_identity</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown3">Nosotros
                                    <i class="material-icons right">web</i></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <div class="container">


