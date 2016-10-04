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

function validarCliente() {
    var id = document.getElementById("txtDocumento");
    alert(id.value);
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
                document.getElementById("divCambio").innerHTML = rta;

            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById(ajax.responseText);
            }
        }
        else
        {
            var rta = ajax.responseText;
            document.getElementById(ajax.responseText);
        }
    }
}

function validarCampoFecha() {
    var fecha = document.getElementById("txtFecha_salida");
    var personas = document.getElementById("txtCantPer");
    if (personas.value !== "" && fecha.value !== "") {
        cargarHabitaciones();
    }
}

function validarCampoPersonas() {
    var personas = document.getElementById("txtCantPer");
    var fecha = document.getElementById("txtFecha_salida");
    if (personas.value !== "" && fecha.value !== "") {
        cargarHabitaciones();
    }
}

function cargarHabitaciones() {
    var cant = document.getElementById("txtCantPer");
    var fecha = document.getElementById("txtFecha_salida");
    ajax = nuevoAjax();

    parametros = "cant=" + cant.value + "&fecha=" + fecha.value;
    url = "procesar/habitaciones.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
                $('#habitacion').material_select();
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
            }
        }
        else
        {
            var rta = ajax.responseText;
            document.getElementById("cargar").innerHTML = rta;
        }
    }
}

function registrarHospedaje() {
    var id_cliente = document.getElementById("txtDocumento");
    var nombre_cliente = document.getElementById("txtNombre");
    var apellido_cliente = document.getElementById("txtApellido");
    var telefono = document.getElementById("txtTelefono");
    var email = document.getElementById("txtEmail");
    var procedencia = document.getElementById("txtProcedencia");
    var cant = document.getElementById("txtCantPer");
    var fecha = document.getElementById("txtFecha_salida");
    var habitacion = document.getElementById("habitacion");
    ajax = nuevoAjax();
    parametros = "id_cliente=" + id_cliente.value + "&nombre_cliente=" + nombre_cliente.value + "&apellido_cliente=" + apellido_cliente.value +
            "&telefono=" + telefono.value + "&email=" + email.value + "&procedencia=" + procedencia.value + "&cant=" + cant.value + "&fecha=" + fecha.value + "&habitacion=" + habitacion.value;
    url = "procesar/registrarHospedaje.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("S") > 0) {
                    document.getElementById("resultado").innerHTML = "Registro exitoso!";
                    $('#habitacion').reset();
                    document.getElementById("registrarForm").reset();
                }
                else
                {
                    document.getElementById("resultado").innerHTML = "Fallo registro!";
                }
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
            }
        }
    }
}

function consultarHospedaje() {
    var id_cliente = document.getElementById("txtBusq");
    var f_salida = document.getElementById("txtFsalida");
    var f_entrada = document.getElementById("txtFentrada");
    ajax = nuevoAjax();
    parametros = "id_cliente=" + id_cliente.value + "&f_salida=" + f_salida.value + "&f_entrada=" + f_entrada.value;
    url = "procesar/procesarConsulta.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;

                document.getElementById("cambio").innerHTML = rta;
            }
        }
    }
}

function consultarHospedajeActivo() {
    var id_cliente = document.getElementById("txtBusq");
    var habitacion = document.getElementById("txtHabitacion");
    ajax = nuevoAjax();
    parametros = "id_cliente=" + id_cliente.value + "&habitacion=" + habitacion.value;
    url = "procesar/procesarConsultaA.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;

                document.getElementById("cambio").innerHTML = rta;
            }
        }
    }
}

function modificarHospedaje() {
    var id = document.getElementById("txtId");
    var id_cliente = document.getElementById("txtDocumento");
    var cant = document.getElementById("txtCantPer");
    var fecha = document.getElementById("txtFecha_salida");
    var habitacion = document.getElementById("habitacion");
    var habAnt = document.getElementById("txtHabAnt");
    ajax = nuevoAjax();

    parametros = "id=" + id.value + "&id_cliente=" + id_cliente.value + "&cant=" + cant.value + "&fecha=" + fecha.value + "&habitacion=" + habitacion.value + "&habAnt=" + habAnt.value;
    url = "procesar/modificarHospedaje.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("S") > 0) {
                    document.getElementById("divResultado").innerHTML = "Modificación exitoso!";
                    $("#registrarForm")[0].reset();
                }
                else
                {
                    document.getElementById("divResultado").innerHTML = "Fallo modificación!";
                }
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML = rta;
            }
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
