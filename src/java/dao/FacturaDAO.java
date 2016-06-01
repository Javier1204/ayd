/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FacturaDTO;
import interfaces.IFacturaDAO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class FacturaDAO implements IFacturaDAO {

    private Connection conn;

    @Override
    public FacturaDTO generarFacturaHospedaje(FacturaDTO dto) throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        FacturaDTO factura = null;

        int dias = 0;
        long diferencia = 0;
        try {
            stmt2 = conn.prepareStatement("SELECT id_habitacion,fecha_salida,fecha_inicio FROM hospedaje WHERE "
                    + "id = '" + dto.getId_servicio() + "'");
            ResultSet re = stmt2.executeQuery();
            while (re.next()) {
               

                String idHabi = re.getString(1);
                String fechaInicio = re.getString(3);
                String fechaSalida = re.getString(2);

                dto.setDescripcion("Hospedaje en la habitación " + idHabi + " desde la fecha " + fechaInicio + " hasta " + fechaSalida);

                String[] partsIni = fechaInicio.split("-");
                int añoIni = Integer.parseInt(partsIni[0]);
                int mesIni = Integer.parseInt(partsIni[1]);
                int diaIni = Integer.parseInt(partsIni[2]);

                String[] partsSal = fechaSalida.split("-");
                int añoSal = Integer.parseInt(partsSal[0]);
                int mesSal = Integer.parseInt(partsSal[1]);
                int diaSal = Integer.parseInt(partsSal[2]);

                Calendar dateInicio = new GregorianCalendar(añoIni, mesIni - 1, diaIni);
                java.sql.Date dateIni = new java.sql.Date(dateInicio.getTimeInMillis());

                Calendar dateSalida = new GregorianCalendar(añoSal, mesSal - 1, diaSal);
                java.sql.Date dateSal = new java.sql.Date(dateSalida.getTimeInMillis());

                final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;
                diferencia = (dateSal.getTime() - dateIni.getTime()) / MILLSECS_PER_DAY;
                
      

                stmt3 = conn.prepareStatement("SELECT tarifa FROM habitacion WHERE id_habitacion = '" + idHabi + "'");
            }
            re = stmt3.executeQuery();
            while (re.next()) {
                
               
                dias = (int) diferencia;
                if (dias == 0) {
                    dias = 1;
                }
                
                dto.setPrecio(re.getInt(1) * dias);
            }
            stmt = conn.prepareStatement("INSERT INTO factura (id_cliente, id_hospedaje, tipo_servicio, precio, fecha,descripcion) "
                    + "VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, dto.getId_cliente());
            stmt.setString(2, dto.getId_servicio());
            stmt.setString(3, dto.getTipo_servicio());
            stmt.setInt(4, dto.getPrecio());
            stmt.setString(5, dto.getFecha_factura());
            stmt.setString(6, dto.getDescripcion());
        
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();

            }

            stmt1 = conn.prepareStatement("SELECT num_factura FROM factura WHERE id_hospedaje = '" + dto.getId_servicio() + "' AND tipo_servicio = '" + "Hospedaje" + "'");
            re = stmt1.executeQuery();
            while (re.next()) {
                dto.setNum_factura(re.getInt(1));
            }
            re.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt1 != null) {
                stmt1.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }

    @Override
    public FacturaDTO generarFacturaRecurso(FacturaDTO dto) throws Exception {
        conn = Conexion.conectar();
        ArrayList<String> recursos = new ArrayList<>();
        PreparedStatement stmt = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        FacturaDTO factura = null;
        int dias = 0;
        long diferencia = 0;

        try {

            stmt3 = conn.prepareStatement("SELECT nombre_recurso, servicios ,fecha_inicio, fecha_salida FROM reserva_recurso WHERE id = '" + dto.getId_servicio() + "'");
            ResultSet re = stmt3.executeQuery();
            while (re.next()) {
                String nombreRec = re.getString(1);
                String fechaInicio = re.getString(3);
                String fechaSalida = re.getString(4);

                dto.setDescripcion("Reserva recurso " + nombreRec + " desde la fecha " + fechaInicio + " hasta " + fechaSalida
                        + " con los servicios adicionales de " + re.getString(2));

                String[] partsIni = fechaInicio.split("-");
                int añoIni = Integer.parseInt(partsIni[0]);
                int mesIni = Integer.parseInt(partsIni[1]);
                int diaIni = Integer.parseInt(partsIni[2]);

                String[] partsSal = fechaSalida.split("-");
                int añoSal = Integer.parseInt(partsSal[0]);
                int mesSal = Integer.parseInt(partsSal[1]);
                int diaSal = Integer.parseInt(partsSal[2]);

                Calendar dateInicio = new GregorianCalendar(añoIni, mesIni - 1, diaIni);
                java.sql.Date dateIni = new java.sql.Date(dateInicio.getTimeInMillis());

                Calendar dateSalida = new GregorianCalendar(añoSal, mesSal - 1, diaSal);
                java.sql.Date dateSal = new java.sql.Date(dateSalida.getTimeInMillis());

                final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;
                diferencia = (dateSal.getTime() - dateIni.getTime()) / MILLSECS_PER_DAY;

                stmt2 = conn.prepareStatement("SELECT tarifa FROM recurso WHERE nombre = '" + nombreRec + "'");
            }
            re = stmt2.executeQuery();
            while (re.next()) {
                dias = (int) diferencia;
                if (dias == 0) {
                    dias = 1;
                }
                dto.setPrecio(re.getInt(1) * dias);
            }

            stmt = conn.prepareStatement("INSERT INTO factura (id_cliente, id_res_recurso, tipo_servicio, precio, fecha,descripcion) "
                    + "VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, dto.getId_cliente());
            stmt.setString(2, dto.getId_servicio());
            stmt.setString(3, dto.getTipo_servicio());
            stmt.setInt(4, dto.getPrecio());
            stmt.setString(5, dto.getFecha_factura());
            stmt.setString(6, dto.getDescripcion());
            int total = stmt.executeUpdate();
            stmt1 = conn.prepareStatement("SELECT num_factura FROM factura WHERE id_res_recurso = '" + dto.getId_servicio() + "' AND tipo_servicio = '" + "Recurso" + "'");
            re = stmt1.executeQuery();
            while (re.next()) {
                dto.setNum_factura(re.getInt(1));
            }
            re.close();
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt3 != null) {
                stmt3.close();
            }
            if (stmt2 != null) {
                stmt2.close();
            }
            if (stmt1 != null) {
                stmt1.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }

    @Override
    public ArrayList<FacturaDTO> consultarFacturaHospedaje(String id_hospedaje) throws Exception {
        conn = Conexion.conectar();
        ArrayList<FacturaDTO> facturas = new ArrayList<>();
        PreparedStatement stmt = null;
        FacturaDTO factura = null;

        try {
            if (id_hospedaje != null) {
                stmt = conn.prepareStatement("SELECT * FROM factura WHERE id_hospedaje = '" + id_hospedaje + "' AND tipo_servicio = '" + "Hospedaje" + "'");
                ResultSet re = stmt.executeQuery();
                while (re.next()) {
                    factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
                stmt.close();
                re.close();
            } else {
                stmt = conn.prepareStatement("SELECT * FROM factura WHERE tipo_servicio = 'Hospedaje'");
                ResultSet re = stmt.executeQuery();
                while (re.next()) {
                    factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return facturas;
    }

    @Override
    public ArrayList<FacturaDTO> consultarFacturaResRecurso(String id_recurso) throws Exception {
        conn = Conexion.conectar();
        ArrayList<FacturaDTO> facturas = new ArrayList<>();
        PreparedStatement stmt = null;
        FacturaDTO factura = null;
  
        try {
            if (id_recurso != null) {
                stmt = conn.prepareStatement("SELECT * FROM factura WHERE id_res_recurso = '" + id_recurso + "' AND tipo_servicio = '" + "Recurso" + "'");
                ResultSet re = stmt.executeQuery();
                while (re.next()) {
                    factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(7), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
                stmt.close();
                re.close();
            } else {
                stmt = conn.prepareStatement("SELECT * FROM factura WHERE tipo_servicio = 'Recurso'");
                ResultSet re = stmt.executeQuery();
                while (re.next()) {
                    factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(7), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return facturas;
    }

    @Override
    public ArrayList<FacturaDTO> consultarFacturaCliente(String id_cliente) throws Exception {
        conn = Conexion.conectar();
        ArrayList<FacturaDTO> facturas = new ArrayList<>();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement("SELECT * FROM factura WHERE id_cliente = '" + id_cliente + "'");
            ResultSet re = stmt.executeQuery();
            while (re.next()) {
                if (re.getString(4).equals("Hospedaje")) {
                    FacturaDTO factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                } else {
                    FacturaDTO factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(7), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
            }
            stmt.close();
            re.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return facturas;
    }

    @Override
    public ArrayList<FacturaDTO> mostrarFacturas() throws Exception {
        conn = Conexion.conectar();
        ArrayList<FacturaDTO> facturas = new ArrayList<>();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement("SELECT * FROM factura WHERE 1");
            ResultSet re = stmt.executeQuery();
            while (re.next()) {
                if (re.getString(4).equals("Hospedaje")) {
                    FacturaDTO factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                } else {
                    FacturaDTO factura = new FacturaDTO(re.getInt(1), re.getString(2), re.getString(7), re.getString(4), re.getInt(5), re.getString(6), re.getString(8));
                    facturas.add(factura);
                }
            }
            stmt.close();
            re.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return facturas;
    }

}
