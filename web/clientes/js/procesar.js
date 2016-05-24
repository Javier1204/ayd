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

function registrarCliente() {
    alert("si");
    var id_cliente = document.getElementById("txtDocumento");
    var nombre_cliente = document.getElementById("txtNombre");
    var apellido_cliente = document.getElementById("txtApellido");
    var telefono = document.getElementById("txtTelefono");
    var email = document.getElementById("txtEmail");
    var procedencia = document.getElementById("txtProcedencia");
    ajax = nuevoAjax();
    
    parametros = "id_cliente=" + id_cliente.value + "&nombreCliente=" + nombre_cliente.value + "&apellido=" + apellido_cliente.value + "&telefono=" + telefono.value +
            "&email="+email.value+"&procedencia=" + procedencia.value;
    url = "procesar/registrar.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("S") > 0) {
                    document.getElementById("divCambio").innerHTML = "Registro exitoso!";
                    $("#registrarForm")[0].reset(); 
                }
                else
                {
                    document.getElementById("divCambio").innerHTML = "Fallo registro!";
                }
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById("divCambio").innerHTML = rta;
            }
        }
    }
}

function consultarCliente() {
    var id_cliente = document.getElementById("txtBusq");
    alert("sí");
    ajax = nuevoAjax();
    parametros = "id_cliente=" + id_cliente.value;
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