/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


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

function registrarEmpleado(){
    
    var div = "mostrarRegistro";
    var nombre = document.getElementById("nombre");
    var apellidos = document.getElementById("apellido");
    var cc = document.getElementById("cc");
    var cargo = document.getElementById("cargo");
    var lugar_nto = document.getElementById("lugar_nac");
    var fecha_nto = document.getElementById("fecha_nac");
    var nivel_estudio = document.getElementById("niv_estud");
    var direccion = document.getElementById("direccion");
    var celular = document.getElementById("tel_cel");
    var fijo = document.getElementById("tel_fijo");
    var email = document.getElementById("email");
    var genero = document.getElementById("genero");
    var experiencia = document.getElementById("anos_experiencia");
    
    
    ajax = nuevoAjax();

    parametros = "nombres=" + nombre.value + "&apellidos=" + apellidos.value + "&cc=" + cc.value + "&cargo=" + cargo.value + "&lugar_nto=" + lugar_nto.value +
            "&fecha_nto=" + fecha_nto.value + "&nivel_estudio=" + nivel_estudio.value + "&direccion=" + direccion.value + "&celular=" + celular.value + "&fijo=" + fijo.value + "&email=" + email.value + "&genero=" + genero.value + "&antiguedad=" + experiencia.value;
    url = "procesar/procesarRegistro.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
                $(document).ready(function () {
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });
                 $('#modal1').openModal();
                document.getElementById(div).innerHTML = ajax.responseText;
                document.getElementById('nombre').value = '';
                document.getElementById('apellido').value = '';
                document.getElementById('cc').value = '';
                document.getElementById('cargo').value = '';
                document.getElementById('lugar_nac').value = '';
                document.getElementById('fecha_nac').value = '';
                document.getElementById('niv_estud').value = '';
                document.getElementById('direccion').value = '';
                document.getElementById('tel_cel').value = '';
                document.getElementById('tel_fijo').value = '';
                document.getElementById('email').value = '';
                document.getElementById('genero').value = '';               
                document.getElementById('anos_cargo').value = '';             
                document.getElementById('nombre').focus();

            } else
            {

                document.getElementById(div).innerHTML = ajax.responseText;

            }
        } else
        {
            document.getElementById(div).value = "Cargando";
        }
    }
    
}

function consultarEmpleado(){
    var div = "tablaF";
    var radios = document.getElementById("tipo");
    var dato = document.getElementById("buscar_empleado");
    ajax = nuevoAjax();


    parametros = "tipo="+radios.value+"&dato="+dato.value;
    url = "procesar/procesarConsulta.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {

                document.getElementById(div).innerHTML = ajax.responseText;

            } else
            {

                document.getElementById(div).innerHTML = ajax.responseText;

            }
        } else
        {
            document.getElementById(div).value = "Cargando";
        }
    }
}
function modificarEmpleado(){
    var div = "modificar";
    var nombre = document.getElementById("nombre");
    var apellidos = document.getElementById("apellido");
    var cc = document.getElementById("cc");
    var cargo = document.getElementById("cargo");  
    var nivel_estudio = document.getElementById("niv_estud");
    var direccion = document.getElementById("direccion");
    var celular = document.getElementById("tel_cel");
    var fijo = document.getElementById("tel_fijo");
    var email = document.getElementById("email");
    var experiencia = document.getElementById("anos_experiencia");
    
    ajax = nuevoAjax();

    parametros = "nombres=" + nombre.value + "&apellidos=" + apellidos.value + "&cc=" + cc.value + "&cargo=" + cargo.value + 
            "&nivel_estudio=" + nivel_estudio.value + "&direccion=" + direccion.value + "&celular=" + celular.value + "&fijo=" + fijo.value + "&email=" + email.value + "&antiguedad=" + experiencia.value;
    url = "procesar/procesarModificacion.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
     ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
                $(document).ready(function () {
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });
                 $('#modal1').openModal();
                document.getElementById(div).innerHTML = ajax.responseText;

            } else
            {

                document.getElementById(div).innerHTML = ajax.responseText;

            }
        } else
        {
            document.getElementById(div).value = "Cargando";
        }
    }
}