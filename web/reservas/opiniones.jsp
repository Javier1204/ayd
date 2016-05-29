<%-- 
    Document   : opiniones
    Created on : 28-may-2016, 9:46:59
    Author     : Javier
--%>

<%@page import="dto.ComentarioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<jsp:include page="../plantillas/usuario/header.jsp"/>
<%
    Fachada fachada = new Fachada();
    ArrayList<ComentarioDTO> comentarios = fachada.obtenerComentarios();
%>   
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6">
            <div class="row">
                <h2> <i class="fa fa-comments"></i>Los usuarios dijeron...</h2>
                <div class="col-md-12" style="margin-bottom: 30px;">
                    <div class="form-group">
                        <div class="col-lg-offset-0">
                            <table class="table table-responsive table-condensed">
                                <% for (ComentarioDTO c : comentarios) {%>
                                <tr>
                                    <td> <label><%=c.getNick()%></label></td>
                                    <td> <%=c.getComentario()%></td>
                                    <td> <%=c.getFecha()%></td>
                                </tr> 
                                <% }%>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-offset-2 col-lg-8">
            <div class="box">
                <div class="box-pane">
                    <div class="row">
                        <div class="col-md-12 col-lg-12" style="margin-bottom: 30px;">
                            <form name="registrarForm" id="registrarForm" action="procesar/registrarComentario.jsp" method="post">
                                <legend><i class="fa fa-comment"></i> Comenta </legend><br>
                                <div class="col-lg-4 col-md-4">
                                    <label>Nick</label>
                                    <input type="text" name="txtNick" required id="txtNick" placeholder="Nick" class="form-control" />    
                                </div>
                                <div class="col-lg-6 col-md-4">
                                    <label> Comentario</label>
                                    <textarea type="text" name="txtComentario" id="txtComentario" required placeholder="Comentario" class="form-control"> </textarea>
                                </div>  
                                <div class="col-md-12 col-lg-12" style="margin-bottom: 30px;">
                                    <div class="col-lg-6 col-md-6">
                                        <input type="submit" class="btn btn-primary" value="Registrar" name="registrar" id="registrar"/> 
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../plantillas/usuario/footer.jsp"/>