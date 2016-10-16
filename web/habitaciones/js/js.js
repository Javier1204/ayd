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

function registrarHabitacion(){
    
    var tipo = document.getElementById("tipo");
    var descripcion = document.getElementById("descrip");
    var id = document.getElementById("id_hab");
    var file1 = document.getElementById("file1");
    var tarifa = document.getElementById("tarifa");
    var campo = "mostrarRegistro";

    
    ajax = nuevoAjax();
    parametros = "tipo=" + tipo.value + "&id=" + id.value + "&descripcion=" + descripcion.value+ "&file1=" + file1.value + "&tarifa=" + tarifa.value;
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
                document.getElementById(campo).innerHTML = ajax.responseText;
               

            } else
            {

                document.getElementById(campo).innerHTML = ajax.responseText;

            }
        } else
        {
            document.getElementById(campo).value = "Cargando";
        }
    }
    
}