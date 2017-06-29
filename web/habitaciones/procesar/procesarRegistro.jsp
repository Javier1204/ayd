<%-- 
    Document   : procesarRegistro
    Created on : 27/09/2016, 03:02:31 PM
    Author     : javie
--%>
<%@page import="facade.Fachada"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String nueva = "";
String ruta2 = getServletContext().getRealPath("/");
ruta2 += "images";
    UploadBean upBean = new UploadBean();
    UploadFile file = null;
    upBean.setFolderstore(ruta2);
    boolean msg = false;
    String tipo = "";
    String id = "";
    String descripcion = "";
    int tarifa;
    
    Fachada fachada = new Fachada();

    if (!MultipartFormDataRequest.isMultipartFormData(request)) {
        msg = false;

    } else {

        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        Hashtable files = mrequest.getFiles();
        id = mrequest.getParameter("id");
        tipo = mrequest.getParameter("tipo");
        tarifa = Integer.parseInt(mrequest.getParameter("tarifa"));
        descripcion = mrequest.getParameter("descripcion");

        
        if ((files != null) && (!files.isEmpty())) {

            file = (UploadFile) files.get("file1");

            if (file == null) {

                msg = true;
            }
            if (file.getFileName() != null) {
                File filess = new File(ruta2 + "/" + id + ".jpg");

                filess.delete();
                file.setFileName(id + ".jpg");
                upBean.store(mrequest, "file1");
                nueva="../images/"+id+".jpg";
                msg = fachada.registrarHabitacion(id, descripcion, tipo, nueva, tarifa);
                System.out.println(ruta2);
            }

        } else {
            msg = false;
        }

    } if(msg){
    %><div class="modal-content">
     <h2><label class="blue-text"><center>¡¡REGISTRO EXITOSO!!</center></label></h2>
      <p>La habitación se ha registrado satifactoriamente en la base de datos</p>
    </div>
    <div class="modal-footer">
       <a href="registrarHabitacion.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar</a>
    </div>


<%
        }else{
            
  %><div class="modal-content">
     <h2><label class="blue-text"><center>¡¡REGISTRO FALLIDO!!</center></label></h2>
      <p>Ha ocurrido un errror a la hora de registrar la habitacion. Puede ser fallo de conexión a la base de datos o la habitación con su id ya existe en la base de datos, si es esta por favor verifque la id</p>
    </div>
    <div class="modal-footer">
      <a href="registrarHabitacion.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">Continuar</a>
    </div>
  
  <%
        }
            %>