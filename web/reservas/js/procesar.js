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

function registrarReserva() {
    var id_habitacion = document.getElementById("habitacion");
    var id_cliente = document.getElementById("txtDocumento");
    var cantidad = document.getElementById("txtCantPer");
    var fecha_inicio = document.getElementById("from");
    var fecha_salida = document.getElementById("to");
    var nombre_cliente = document.getElementById("txtNombre");
    var telefono = document.getElementById("txtTelefono");
    var email = document.getElementById("txtEmail");
    var apellido_cliente = document.getElementById("txtApellido");
    var procedencia_cliente = document.getElementById("txtProcedencia");
    ajax = nuevoAjax();

    parametros = "id_habitacion" + id_habitacion.value + "&id_cliente" + id_cliente.value + "&cantidad" + cantidad.value + "&fecha_inicio" + fecha_inicio.value +
            "&fecha_salida" + fecha_salida.value + "&nombre_cliente" + nombre_cliente.value + "&telefono" + telefono.value + "&email" +
            email.value + "&apellido_cliente" + apellido_cliente.value + "&procedencia_cliente" + procedencia_cliente.value;
    url = "procesar/procesarRegReserva.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("S") > 0) {
                    document.getElementById("divResultado").innerHTML = "Registro exitoso!";
                    $("#registrarForm")[0].reset();
                } else
                {
                    document.getElementById("divResultado").innerHTML = "Fallo registro!";
                }
            } else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
            }
        }
    }
}

function validarCampoFecha() {
    var fecha = document.getElementById("to");
    var personas = document.getElementById("txtCantPer");
    if (personas.value !== "" && fecha.value !== "") {
        cargarHabitaciones();
    }
}

function validarCampoPersonas() {
    var personas = document.getElementById("txtCantPer");
    var fecha = document.getElementById("to");
    if (personas.value !== "" && fecha.value !== "") {
        cargarHabitaciones();
    }
}

function cargarHabitaciones() {
    alert("Mostrando habitaciones disponibles");
    var cant = document.getElementById("txtCantPer");
    var fechaE = document.getElementById("from");
    var fechaS = document.getElementById("to");
    ajax = nuevoAjax();

    parametros = "cant=" + cant.value + "&fechaE=" + fechaE.value + "&fechaS=" + fechaS.value;
    url = "procesar/habitaciones.jsp";
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

function cargarDescripcion(sel) {
    var habitacion = sel;
    ajax = nuevoAjax();
    parametros = "habitacion=" + habitacion.value;
    url = "procesar/cargarDescripcion.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("descripcion").innerHTML = rta;
            }
        }
    }
}

