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
        <title>SIHYEST </title>
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
 