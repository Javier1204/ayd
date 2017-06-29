<%-- 
    Document   : procesarHistoria
    Created on : 15-oct-2016, 23:48:36
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String historia = request.getParameter("historia");
    Fachada fachada = new Fachada();
    boolean exito = fachada.modifcarHistoria(historia);
    if(exito){
%>
<div class="modal-content">
     <h2><label class="blue-text"><center>¡¡HISTORIA MODIFICADA CON EXITO!!</center></label></h2>
      <p>La historia del hotel se ha actualizado satifactoriamente en la base de datos</p>
    </div>
    <div class="modal-footer">
       <a href="modificarHistoria.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar historia</a>
    </div>


<%
        }else{
            
  %><div class="modal-content">
     <h2><label class="blue-text"><center>¡¡MODIFICACION ERRONEA!!</center></label></h2>
      <p>Ha ocurrido un errror a la hora de actualizar la historia del hotel. ¡¡fallo de conexión a la base de datos !!</p>
    </div>
    <div class="modal-footer">
      <a href="modificarHistoria.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar historia</a>
    </div>
  
  <%
        }
            %>