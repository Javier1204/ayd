<%-- 
    Document   : procesarVision
    Created on : 15-oct-2016, 23:48:23
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String vision = request.getParameter("vision");
    Fachada fachada = new Fachada();
    boolean exito = fachada.modifcarVision(vision);
    if(exito){
%>
<div class="modal-content">
     <h2><label class="blue-text"><center>¡¡VISION MODIFICADA CON EXITO!!</center></label></h2>
      <p>La vision del hotel se ha actualizado satifactoriamente en la base de datos</p>
    </div>
    <div class="modal-footer">
       <a href="modificarVision.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar visión</a>
    </div>


<%
        }else{
            
  %><div class="modal-content">
     <h2><label class="blue-text"><center>¡¡MODIFICACION ERRONEA!!</center></label></h2>
      <p>Ha ocurrido un errror a la hora de actualizar la vision del hotel. ¡¡fallo de conexión a la base de datos !!</p>
    </div>
    <div class="modal-footer">
      <a href="modificarVision.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar visión</a>
    </div>
  
  <%
        }
            %>