<%-- 
    Document   : procesarModificacion
    Created on : 15-oct-2016, 23:45:19
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String cc = request.getParameter("cc");
        String cargo = request.getParameter("cargo");
        String nivel_estudio = request.getParameter("nivel_estudio");
        String direccion = request.getParameter("direccion");    
        String celular = request.getParameter("celular");
        String fijo = request.getParameter("fijo");
        String email = request.getParameter("email");
        String antiguedad = request.getParameter("antiguedad");
        int ant = Integer.parseInt(antiguedad);
        Fachada fachada = new Fachada();
        boolean exito = fachada.modificarEmpleado(nombres, apellidos, cc, cargo, nivel_estudio, direccion, fijo, celular, email, ant);
        if(exito){
%>
<div class="modal-content">
     <h2><label class="green-text"><center>¡¡EMPLEADO MODIFICADO CON EXITO!!</center></label></h2>
      <p>El empleado se ha actualizado satifactoriamente en la base de datos</p>
    </div>
    <div class="modal-footer">
       <a href="consultarEmpleado.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en consulta</a>
    </div>


<%
        }else{
            
  %><div class="modal-content">
     <h2><label class="green-text"><center>¡¡MODIFICACION ERRONEA!!</center></label></h2>
      <p>Ha ocurrido un errror a la hora de actualizar el empleado. ¡¡fallo de conexión a la base de datos !!</p>
    </div>
    <div class="modal-footer">
      <a href="consultarEmpleado.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en consulta</a>
    </div>
  
  <%
        }
            %>