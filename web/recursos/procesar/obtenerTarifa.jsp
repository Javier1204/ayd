<%-- 
    Document   : obtenerTarifa
    Created on : 27-may-2016, 22:18:40
    Author     : FARID SANTIAGO
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tarifa = request.getParameter("tarifa");
    Fachada fachada = new Fachada();
    
    String tar = fachada.obtenerTarifaRecurso(tarifa);
%>
<% if(tar!=null){ %>
    <table id="tablaTarifa" class="table table-bordered table-striped">
           <tr>
              <td> Tarifa de Recurso</td>
              <td>
                  <input type="text" name="txtTarifa" value="<%=tar%>"id="txtTarifa" class="form-control" readonly="true"/>
              </td>
           </tr>
 </table>
<% } else { %>
     <table id="tablaTarifa" class="table table-bordered table-striped">
           <tr>
              <td> Tarifa de Recurso</td>
              <td>
                  <input type="text" name="txtTarifa" id="txtTarifa" class="form-control" readonly="true"/>
              </td>
           </tr>
 </table>
<% } %>
