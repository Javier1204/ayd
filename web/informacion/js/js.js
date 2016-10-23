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
function modificarMision(){
    var mision = document.getElementById("textareaMision");   
    
    var campo = "actualizarMision";
    ajax = nuevoAjax();
    parametros = "mision=" + mision.value;
    url = "procesar/procesarMision.jsp";
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

function modificarVision(){
    var vision = document.getElementById("textareaVision");   
    
    var campo = "actualizarVision";
    ajax = nuevoAjax();
    parametros = "vision=" + vision.value;
    url = "procesar/procesarVision.jsp";
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

function modificarHistoria(){
    var historia = document.getElementById("textareaHistoria");   
    
    var campo = "actualizarHistoria";
    ajax = nuevoAjax();
    parametros = "historia=" + historia.value;
    url = "procesar/procesarHistoria.jsp";
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