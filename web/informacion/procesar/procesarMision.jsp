<%-- 
    Document   : procesarMision
    Created on : 15-oct-2016, 23:48:12
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mision = request.getParameter("mision");
    Fachada fachada = new Fachada();
    boolean exito = fachada.modifcarMision(mision);
    if(exito){
%>

<div class="modal-content">
     <h2><label class="blue-text"><center>¡¡MISION MODIFICADA CON EXITO!!</center></label></h2>
      <p>La mision del hotel se ha actualizado satifactoriamente en la base de datos</p>
    </div>
    <div class="modal-footer">
       <a href="modificarMision.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar misión</a>
    </div>


<%
        }else{
            
  %><div class="modal-content">
     <h2><label class="blue-text"><center>¡¡MODIFICACION ERRONEA!!</center></label></h2>
      <p>Ha ocurrido un errror a la hora de actualizar la mision del hotel. ¡¡fallo de conexión a la base de datos !!</p>
    </div>
    <div class="modal-footer">
      <a href="modificarMision.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar en modificar misión</a>
    </div>
  
  <%
        }
            %>