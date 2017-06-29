/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pdf;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.ZapfDingbatsList;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dto.ClienteDTO;
import dto.FacturaDTO;
import facade.Fachada;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.Calendar;

/**
 *
 * @author tuto2
 */
public class PDF {

    public void crearPDF(FacturaDTO dto) {

        Rectangle pageSize = new Rectangle(600f, 600f); //ancho y alto
        // Creacion del documento con los margenes
        Document document = new Document(pageSize, 35, 30, 50, 50);
        try {
            DecimalFormat fact = new DecimalFormat("00000");
            // El archivo pdf que vamos a generar
            FileOutputStream fileOutputStream = new FileOutputStream("Factura" + fact.format(dto.getNum_factura())+".pdf");

            // Obtener la instancia del PdfWriter
            PdfWriter.getInstance(document, fileOutputStream);

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
//   Chunk porcionTexto = new Chunk("Hotel DAYAMAR");
//   Chunk porcionTexto2 = new Chunk("NIT 63338703-0");
//   Chunk porcionTexto3 = new Chunk("CL 6 NRO. 1-30 BR. CHAPINERO");
            Paragraph parrafo = new Paragraph();

            parrafo.add("Hotel DAYAMAR");
            parrafo.add(new Phrase(Chunk.NEWLINE));

            parrafo.add("NIT 63338703-0");
            parrafo.add(new Phrase(Chunk.NEWLINE));

            parrafo.add("CL 6 NRO. 1-30 BR. CHAPINERO");
            parrafo.add(new Phrase(Chunk.NEWLINE));

////            Image image = null;

            // Obtenemos el logo de datojava
            
//            URL is = getClass().getResource("sihyest.png");
//            image = Image.getInstance(is);
//            image.scaleAbsolute(80f, 60f);

            // Creacion de una tabla
            PdfPTable table = new PdfPTable(2);

            // Agregar la imagen anterior a una celda de la tabla
            PdfPCell cell = new PdfPCell(parrafo);

            // Propiedades de la celda
            cell.setColspan(1);
            cell.setBorderColor(BaseColor.WHITE);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            // Agregar la imagen anterior a una celda de la tabla
            PdfPCell cell2 = new PdfPCell();

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

            Fachada fachada = new Fachada();
            ClienteDTO cliente = fachada.consultarCliente(dto.getId_cliente());

            parrafo.add(cliente.getNombre_cliente() + " " + cliente.getApellido());
            parrafo.add(new Phrase(Chunk.NEWLINE));

            parrafo.add(cliente.getId_cliente());
            parrafo.add(new Phrase(Chunk.NEWLINE));

            parrafo.add(cliente.getTelefono());
            parrafo.add(new Phrase(Chunk.NEWLINE));

            cell2 = new PdfPCell(parrafo);

            // Propiedades de la celda
//   cell2.setColspan(1);
//   cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
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

            // Abrir el archivo
            File file = new File("Factura" + fact.format(dto.getNum_factura())+".pdf");
            Desktop.getDesktop().open(file);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
