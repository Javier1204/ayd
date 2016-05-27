<%-- 
    Document   : login
    Created on : 02-abr-2016, 11:49:17
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-escale=1.0" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
        <script type="text/javascript" src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
        <link type="text/css" rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="../public/css/general.css">
        <title>SIHYEST</title>
    </head>
    <body>
        
        <div class="jumbotron boxlogin">
            <center><h2> <image src="../images/intento2.png"/></h2></center>
            <form method="post" action="../hospedajes/registrarHospedaje.jsp" name="login" id="login">
               
                <label>Nombre de usuario</label>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="form-control" />
                <label>Contraseña</label>
                <input type="password" name="contraseña" id="contraseña" placeholder="Contraseña" class="form-control" />
                <input type="submit" class="btn  btn-primary" name="ingresar" id="ingresar" value="Ingresar" />
            </form>
        </div>

    </body>
</html>
