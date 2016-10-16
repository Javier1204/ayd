<%-- 
    Document   : login
    Created on : 02-abr-2016, 11:49:17
    Author     : Javier
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



            });




        </script> 
        <title>SIHYEST</title>
    </head>

    <body background="../images/fondo_login.jpg">
        <br></br>
        <br></br>

        <div class="container ">
            <div class="container white z-depth-5" style="background-image: url(../images/bgbody.jpg)">
                <br></br>
                <div class="container">
                    <div class="row">
                        <form class="col s12" method="post" action="procesarSesion.jsp" name="login" id="login">
                            <div class="row">
                                <div class="input-field col s12 ">
                                    <img src="../images/intento2.png"/>
                                </div>
                                <div class="input-field col s12 ">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input placeholder="Nombre usuario" id="nombre_usuario" type="text" class="validate black-text">
                                    <label for="nombre_usuario">Nombre usuario</label>

                                </div>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">vpn_key</i>
                                    <input placeholder="Contraseña" id="password" type="password" class="validate black-text">
                                    <label for="password">Contraseña</label>

                                </div>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">supervisor_account</i>
                                    <select id="tipo_usuario" name="tipo_usuario">
                                        <option value="" disable selected>--Seleccione una opción--</option>
                                        <option value="administrador">Administrador</option>
                                        <option value="empleado">Recepcionista</option>

                                    </select>
                                    <label for="tipo_usuario">Tipo usuario</label>

                                </div>


                                <div class="input-field col s12 ">
                                    <button type="button" class="btn  btn-success" onclick="validarUsuario();"
                                            name="ingresar" id="ingresar" value="Ingresar" />Ingresar</button>


                                </div>
                            </div>
                        </form>
                        <div id="divError">
                            
                        </div>

                    </div>
                </div>
                <br></br>
            </div>
    </body>
</html>