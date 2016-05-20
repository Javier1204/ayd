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

function validarCliente(){
    alert("También");
    var id = document.getElementById("txtDocumento");
    ajax= nuevoAjax();
    
    parametros = "id="+ id.value;
    url = "procesar/validarCliente.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function (){
        if (ajax.readyState == 4){
            if (ajax.status == 200){
                var rta = ajax.responseText;
                document.getElementById("divCambio").innerHTML= rta;
                
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

function validarCampoFecha(){
    var fecha= document.getElementById("txtFecha_salida");
    if(fecha.value!=""){
        cargarHabitaciones();
    }
}

function validarCampoPersonas(){
    var personas= document.getElementById("txtCantPer");
    if(personas.value!=""){
        cargarHabitaciones();
    }
}

function cargarHabitaciones(){
    alert("funciona");
    var cant = document.getElementById("txtCantPer");
    var fecha = document.getElementById("txtFecha_salida");
    ajax= nuevoAjax();
    
    parametros = "cant="+ cant.value+"&fecha="+fecha.value;
    url = "procesar/habitaciones.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function (){
        if (ajax.readyState == 4){
            if (ajax.status == 200){
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML= rta;
                
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById("cargar").innerHTML= rta;
            }
        }
        else
        {
            var rta = ajax.responseText;
            document.getElementById("cargar").innerHTML= rta;
        }
}
    }