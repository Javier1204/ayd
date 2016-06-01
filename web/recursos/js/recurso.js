/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var pos = 1;
var posD = 1;

function nuevoAjax() {
    var xmlhttp = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}

function validarInformacionCliente() {
    var id = document.getElementById("txtDocumento");
    ajax = nuevoAjax();

    parametros = "id=" + id.value;
    url = "procesar/validarCliente.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("cambioCliente").innerHTML = rta;
            } else
            {
                var rta = ajax.responseText;
                document.getElementById(ajax.responseText);
            }
        } else
        {
            var rta = ajax.responseText;
            document.getElementById(ajax.responseText);
        }
    }
}



function validarCampoFechas() {
    var fechaEntrada = document.getElementById("txtFecha_entrada");
    var fechaSalida = document.getElementById("txtFecha_salida");
    if (fechaSalida.value !== "" && fechaEntrada.value !== "") {
        cargarRecursos();
    }
}

function cargarRecursos() {
    var fecha1 = document.getElementById("txtFecha_entrada");
    var fecha2 = document.getElementById("txtFecha_salida");
    ajax = nuevoAjax();

    parametros = "fechaEntrada=" + fecha1.value + "&fechaSalida=" + fecha2.value;
    url = "procesar/recursos.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;

            } else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
            }
        } else
        {
            var rta = ajax.responseText;
            document.getElementById("cargar").innerHTML = rta;
        }
    }
}

function registrarReservaRecurso() {
    var id_cliente = document.getElementById("txtDocumento");
    var nombre_cliente = document.getElementById("txtNombre");
    var apellido_cliente = document.getElementById("txtApellido");
    var telefono = document.getElementById("txtTelefono");
    var email = document.getElementById("txtEmail");
    var procedencia = document.getElementById("txtProcedencia");
    var nombre_recurso = document.getElementById("recurso");
    var fecha_entrada = document.getElementById("txtFecha_entrada");
    var fecha_salida = document.getElementById("txtFecha_salida");
    var checkboxes = document.getElementById("registrarForm");
    var servicio = "";
    for (var x = 0; x < checkboxes.elements.length; x++) {
        if ((checkboxes[x].type === 'checkbox') && (checkboxes[x].checked === true)) {
            var ser = checkboxes[x].value;
            servicio = servicio.concat(ser, "\n");
        }
    }
    ajax = nuevoAjax();


    parametros = "id_cliente=" + id_cliente.value + "&nombreCliente=" + nombre_cliente.value + "&apellidoCliente=" + apellido_cliente.value +
            "&telefono=" + telefono.value + "&email=" + email.value + "&procedencia=" + procedencia.value + "&nombreRecurso=" + nombre_recurso.value +
            "&fechaEntrada=" + fecha_entrada.value + "&fechaSalida=" + fecha_salida.value + "&servicio=" + servicio;
    url = "procesar/registrarReservaR.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {

            if (ajax.status == 200) {
                var rta = ajax.responseText;

                if (rta.indexOf("Si")) {
                    document.getElementById("registrar").innerHTML = "¡¡Registro Exitoso!!";
                    $("registrarFrom")[0].reset();
                } else
                {
                    var rta = ajax.responseText;
                    document.getElementById("registrar").innerHTML = "¡¡Registro Fallido!!";

                    $("registrarFrom")[0].reset();
                }
            } else
            {
                var rta = ajax.responseText;
                document.getElementById("registrar").innerHTML = rta;
            }
        }
    }


}

function consultarReservaRecurso() {
    var id_cliente = document.getElementById("txtBusq");
    var nombre_recurso = document.getElementById("txtNombreR");
    var fecha_inicio = document.getElementById("txtFechaInicio");
    var fecha_fin = document.getElementById("txtFechaFin");
    ajax = nuevoAjax();

    parametros = "idCliente=" + id_cliente.value + "&nombreRecurso=" + nombre_recurso.value + "&fechaInicio=" + fecha_inicio.value + "&fechaFin=" + fecha_fin.value;
    url = "procesar/consultarReservaR.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;

                document.getElementById("consulta").innerHTML = rta;
            }
        }
    }
}

function modificarReservaRecurso() {
    var id_cliente = document.getElementById("txtDocumento");
    var nombre_recurso = document.getElementById("recurso");
    var fecha_entrada = document.getElementById("txtFecha_entrada");
    var fecha_salida = document.getElementById("txtFecha_salida");
    var nombreRecursoP = document.getElementById("txtNombreRecursoP");
    var fechaInicioP = document.getElementById("txtFechaInicioP");
    var fechaFinP = document.getElementById("txtFechaFinP");
    var checkboxes = document.getElementById("registrarForm");
    var servicio = "";
    for (var x = 0; x < checkboxes.elements.length; x++) {
        if ((checkboxes[x].type === 'checkbox') && (checkboxes[x].checked === true)) {
            var ser = checkboxes[x].value;
            servicio = servicio.concat(ser, "\n");
        }
    }
    ajax = nuevoAjax();

    parametros = "idCliente=" + id_cliente.value + "&nombreRecurso=" + nombre_recurso.value + "&fechaEntrada=" + fecha_entrada.value + "&fechaSalida=" + fecha_salida.value
            + "&servicios=" + servicio + "&nombreRecursoP=" + nombreRecursoP.value + "&fechaInicioP=" + fechaInicioP.value + "&fechaFinP=" + fechaFinP.value;

    url = "procesar/modificarReservaR.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("Si")) {
                    document.getElementById("modificar").innerHTML = "¡¡Información Modificada!!";
                    $("registrarFrom")[0].reset();
                } else
                {
                    var rta = ajax.responseText;
                    document.getElementById("modificar").innerHTML = "¡¡Error en la Modificación!!";
                    $("registrarFrom")[0].reset();
                }
            } else
            {
                var rta = ajax.responseText;
                document.getElementById("modificar").innerHTML = rta;
            }
        }
    }
}

function validarRecurso() {
    var tarifa = document.getElementById("recurso");
    ajax = nuevoAjax();

    parametros = "tarifa=" + tarifa.value;
    url = "procesar/obtenerTarifa.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("tarifa").innerHTML = rta;
            } else
            {
                var rta = ajax.responseText;
                document.getElementById(ajax.responseText);
            }
        } else
        {
            var rta = ajax.responseText;
            document.getElementById(ajax.responseText);
        }
    }
}
