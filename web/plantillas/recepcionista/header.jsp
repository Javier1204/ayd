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
                    format: 'dd-mm-yyyy',
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



    <body bgcolor="#eeeeee">


        <header>
            
            <div class="imagen" style="width:100%;" style="position: relative; display:block; overflow: hidden; margin: auto;"> 
                <a href="#">
                    <img src="../images/bannerB.jpg" alt="" style="max-width:100%;" alt='' >
                </a>
                <%--
              <a href="../index.jsp">
                
                  <img src="../images/logout.png" title='Cerrar sesion'style='position:absolute; top:35px; right:230px; width: 40px' title='HOJAS' alt=''/>
              </a>
                --%>
            </div>

            <div class="container ">

                <ul id="dropdown1" class="dropdown-content grey darken-4" >
                    <li><a href="../hospedajes/registrarHospedaje.jsp"><i class="tiny material-icons white-text">library_add</i></i><span class="white-text" >Registrar hospedaje</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../hospedajes/consultarHospedaje.jsp"><i class="tiny material-icons white-text">search</i></i><span class="white-text" >Consultar hospedajes</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../hospedajes/consultarHospedajesActivos.jsp"><i class="tiny material-icons white-text">search</i></i><span class="white-text" >Consultar hospedajes activos</span></a></li>

                </ul>

                <ul id="dropdown2" class="dropdown-content grey darken-4" >
                    <li><a href="../clientes/registrarCliente.jsp"><i class="tiny material-icons white-text">library_add</i><span class="white-text" >Registrar cliente</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../clientes/consultarCliente.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Cosultar cliente</span></a></li>
                </ul>

                <ul id="dropdown3" class="dropdown-content grey darken-4" >
                    <li><a href="../reservas/verReservas.jsp"><i class="tiny material-icons white-text">loyalty</i><span class="white-text" >Ver reservas</span></a></li>
                </ul>

                <ul id="dropdown4" class="dropdown-content grey darken-4" >
                    <li><a href="../recursos/registrarReserva.jsp"><i class="tiny material-icons white-text">library_add</i><span class="white-text" >Registrar reserva de recurso</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../recursos/consultarReservas.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Consultar recursos reservados</span></a></li>
                </ul>

                <ul id="dropdown5" class="dropdown-content grey darken-4" >
                    <li><a href="../facturas/consultarFacturasCliente.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Cosultar facturas cliente</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../facturas/consultarFacturasHospedaje.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Consultar facturas hospedaje</span></a></li>
                    <li class="divider"></li>
                    <li><a href="../facturas/consultarFacturasRecurso.jsp"><i class="tiny material-icons white-text">search</i><span class="white-text" >Consultar facturas recurso</span></a></li>
                </ul>



                <nav>

                    <div class="nav-wrapper grey darken-3 z-depth-2">

                        <a href="../inicio/principal.jsp" class="brand-logo thin right">RECEPCIONISTA<i class="material-icons left"></i></a>
                        <ul class="left hide-on-med-and-down"> 

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Hospedajes
                                    <i class="material-icons right">store</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown2">Clientes
                                    <i class="material-icons right">perm_identity</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown3">Reservas
                                    <i class="material-icons right">class</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown4">Recursos
                                    <i class="material-icons right">business</i></a></li>

                            <li><a class="dropdown-button" href="#!" data-activates="dropdown5">Facturas
                                    <i class="material-icons right">payment</i></a></li>


                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <div class="container">




