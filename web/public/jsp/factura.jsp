<%-- 
    Document   : factura
    Created on : 31/05/2016, 08:15:52 PM
    Author     : tuto2
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URL"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="dto.ClienteDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="dto.FacturaDTO"%>
<%@page import="facade.Fachada" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String tipo_servicio = request.getParameter("tipo_servicio");
    System.out.println(tipo_servicio);
    String id_servicio = request.getParameter("id_servicio");
    System.out.println(id_servicio);
    Fachada fachada = new Fachada();
    
    System.out.println("idddd2");

    ArrayList<FacturaDTO> list = null;
    if (tipo_servicio.equals("Hospedaje")) {
        list = fachada.consultarFacturaHospedaje(id_servicio);
         System.out.println("idddd4");
    } else {
        list = fachada.consultarFacturaResRecurso(id_servicio);
         System.out.println("idddd3");
    }
    System.out.println("idddd2");
    FacturaDTO dto =null;
    for (FacturaDTO re : list){
        System.out.println("idddd"+ re.getDescripcion());
        dto=re;
    }
        

    response.setContentType("application/pdf");
    Rectangle pageSize = new Rectangle(600f, 600f); //ancho y alto
    // Creacion del documento con los margenes

    Document document = new Document();
    document = new Document(pageSize, 35, 30, 50, 50);
    PdfWriter.getInstance(document, response.getOutputStream());

    try {
        DecimalFormat fact = new DecimalFormat("00000");
        // El archivo pdf que vamos a generar
        document.addTitle("Factura" + fact.format(dto.getNum_factura()) + ".pdf");

        // Abrir el documento
        document.open();

        // Crear las fuentes para el contenido y los titulos
        Font fontContenido = FontFactory.getFont(
                FontFactory.TIMES_ROMAN.toString(), 11, Font.NORMAL,
                BaseColor.DARK_GRAY);
        Font fontTitulos = FontFactory.getFont(
                FontFactory.TIMES_BOLDITALIC, 11, Font.UNDERLINE,
                BaseColor.RED);
        Font negrita = new Font();
        negrita.setStyle(1);

        Font negritaWhite = new Font();
        negritaWhite.setStyle(1);
        negritaWhite.setColor(BaseColor.WHITE);

        //informacion hotel
        Paragraph parrafo = new Paragraph();

        parrafo.add("Hotel DAYAMAR");
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add("NIT 63338703-0");
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add("CL 6 NRO. 1-30 BR. CHAPINERO");
        parrafo.add(new Phrase(Chunk.NEWLINE));
        // Obtenemos el logo de datojava

        Image image = Image.getInstance("http://localhost:8080/ayd/public/jsp/sihyest.png");

        image.scaleAbsolute(80f, 60f);
        // Creacion de una tabla
        PdfPTable table = new PdfPTable(2);

        // Agregar la imagen anterior a una celda de la tabla
        PdfPCell cell = new PdfPCell(parrafo);

        // Propiedades de la celda
        cell.setColspan(1);
        cell.setBorderColor(BaseColor.WHITE);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);

        // Agregar la imagen anterior a una celda de la tabla
        PdfPCell cell2 = new PdfPCell(image);

        // Propiedades de la celda
        cell2.setColspan(1);
        cell2.setBorderColor(BaseColor.WHITE);
        cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);

        // Agregar la celda a la tabla
        table.addCell(cell);
        table.addCell(cell2);

        // Agregar la tabla al documento
        document.add(table);

        document.add(new Phrase(Chunk.NEWLINE));

        // Creacion de una tabla
        table = new PdfPTable(2);

        // Agregar la imagen anterior a una celda de la tabla
        parrafo = new Paragraph();
        parrafo.add("Factura No." + fact.format(dto.getNum_factura()));
        cell = new PdfPCell(parrafo);

        // Propiedades de la celda
        cell.setColspan(1);
        cell.setBorderColor(BaseColor.WHITE);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);

        // Agregar la imagen anterior a una celda de la tabla
        Calendar c1 = Calendar.getInstance();
        parrafo = new Paragraph();
        parrafo.add("Fecha : " + dto.getFecha_factura());
        cell2 = new PdfPCell(parrafo);

        // Propiedades de la celda
        cell2.setColspan(1);
        cell2.setBorderColor(BaseColor.WHITE);
        cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);

        // Agregar la celda a la tabla
        table.addCell(cell);
        table.addCell(cell2);

        // Agregar la tabla al documento
        document.add(table);

        //Cliente
        document.add(new Phrase(Chunk.NEWLINE));

        // Creacion de una tabla
        table = new PdfPTable(2);

        // Agregar la imagen anterior a una celda de la tabla
        parrafo = new Paragraph();

        parrafo.add(new Phrase("Nombre del cliente: ", negrita));
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add(new Phrase("Numero de identificacion: ", negrita));
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add(new Phrase("Telefono: ", negrita));
        parrafo.add(new Phrase(Chunk.NEWLINE));

        cell = new PdfPCell(parrafo);

        // Propiedades de la celda
//   cell.setColspan(1);
//   cell.setBorderColor(BaseColor.WHITE);
//   cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        // Agregar la imagen anterior a una celda de la tabla
        parrafo = new Paragraph();

        ClienteDTO cliente = fachada.consultarCliente(dto.getId_cliente());

        parrafo.add(cliente.getNombre_cliente() + " " + cliente.getApellido());
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add(cliente.getId_cliente());
        parrafo.add(new Phrase(Chunk.NEWLINE));

        parrafo.add(cliente.getTelefono());
        parrafo.add(new Phrase(Chunk.NEWLINE));

        cell2 = new PdfPCell(parrafo);

        // Agregar la celda a la tabla
        table.addCell(cell);
        table.addCell(cell2);

        // Agregar la tabla al documento
        document.add(table);

        document.add(new Phrase(Chunk.NEWLINE));

        // Creacion de una tabla
        table = new PdfPTable(3);

        parrafo = new Paragraph();
        parrafo.add(new Phrase("DESCRIPCION", negritaWhite));
        parrafo.add(new Phrase(Chunk.NEWLINE));

        cell = new PdfPCell(parrafo);
        cell.setColspan(2);
        cell.setBackgroundColor(BaseColor.DARK_GRAY);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        parrafo = new Paragraph();
        parrafo.add(new Phrase("PRECIO", negritaWhite));
        parrafo.add(new Phrase(Chunk.NEWLINE));

        cell = new PdfPCell(parrafo);
        cell.setBackgroundColor(BaseColor.DARK_GRAY);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.setBorderColorBottom(BaseColor.WHITE);
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.setBorderColorBottom(BaseColor.WHITE);
        table.addCell(cell);

        // descripcion factura
        parrafo = new Paragraph();
        parrafo.add(new Phrase(Chunk.NEWLINE));
        parrafo.add(dto.getDescripcion());

        cell = new PdfPCell(parrafo);
        cell.setColspan(2);
        cell.setFixedHeight(72f);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(cell);

        int valor = dto.getPrecio();

        DecimalFormat decimales = new DecimalFormat("0.00");

        parrafo = new Paragraph();
        parrafo.add(new Phrase(Chunk.NEWLINE));
        parrafo.add("" + valor);

        cell = new PdfPCell(parrafo);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(cell);

        // IVA
        cell = new PdfPCell();
        cell.setBorderWidthLeft(0f);
        cell.setBorderWidthBottom(0f);
        table.addCell(cell);

        parrafo = new Paragraph();
        parrafo.add("Subtotal");
        cell = new PdfPCell(parrafo);
        cell.setBorderColorBottom(BaseColor.WHITE);
        table.addCell(cell);

        double subtotal = (valor / 1.16);

        parrafo = new Paragraph();
        parrafo.add("" + decimales.format(subtotal));
        cell = new PdfPCell(parrafo);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.setBorderWidthLeft(0f);
        cell.setBorderWidthBottom(0f);
        cell.setBorderWidthTop(0f);
        table.addCell(cell);

        parrafo = new Paragraph();
        parrafo.add("IVA 16%");
        cell = new PdfPCell(parrafo);
        cell.setBorderColorBottom(BaseColor.WHITE);
        table.addCell(cell);

        double valorSIVA = (valor - subtotal);
        parrafo = new Paragraph();
        parrafo.add("" + decimales.format(valorSIVA));
        cell = new PdfPCell(parrafo);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.setBorderWidthLeft(0f);
        cell.setBorderWidthBottom(0f);
        cell.setBorderWidthTop(0f);
        table.addCell(cell);

        parrafo = new Paragraph();
        parrafo.add(new Phrase("TOTAL", negrita));
        cell = new PdfPCell(parrafo);
        cell.setBorderColorBottom(BaseColor.WHITE);
        table.addCell(cell);

        parrafo = new Paragraph();
        parrafo.add("" + decimales.format(valor));
        cell = new PdfPCell(parrafo);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(cell);

        // Agregar la tabla al documento
        document.add(table);

        document.add(new Phrase(Chunk.NEWLINE));

        // Cerrar el documento
        document.close();

    } catch (Exception ex) {
        ex.printStackTrace();
    }
    response.sendRedirect("");
%>
