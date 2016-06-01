/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ReservaRecursoDTO;
import interfaces.IReservaRecurso;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class ReservaRecursoDAO implements IReservaRecurso {

    private Connection conn;

    @Override
    public boolean registrarReservaRecurso(ReservaRecursoDTO dto) throws Exception {

        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {
            
            
            stmt = conn.prepareStatement("INSERT INTO reserva_recurso (nombre_recurso, servicios, id_cliente, fecha_inicio, fecha_salida)"
                    + "VALUES(?,?,?,?,?)");
            stmt.setString(1, dto.getNombreRecurso());
            stmt.setString(2, dto.getServicios());
            stmt.setString(3, dto.getId_cliente());
            stmt.setString(4, dto.getFecha_inicio());
            stmt.setString(5, dto.getFecha_final());
            int total = stmt.executeUpdate();
            if(total>0){
                stmt.close();
                exito = true;
            }
        } catch (SQLException e) {
        
//////            if (conn != null) {
//////                System.out.println("error en la transacion, revirtiendo cambios");
//////                conn.rollback();
            
            e.printStackTrace();
        } finally {
          
            if (stmt != null) {
                stmt.close();
            }
         
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public ReservaRecursoDTO consultarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_inicio, String fecha_fin) throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ReservaRecursoDTO reserva = null;

        try {
            stmt = conn.prepareStatement("SELECT * FROM reserva_recurso WHERE id_cliente = '" + id_cliente
                    + "' AND nombre_recurso = '" + nombre_recurso + "' AND fecha_inicio = '" + fecha_inicio + "' AND fecha_salida = '" + fecha_fin + "'");
            ResultSet re = stmt.executeQuery();
            while (re.next()) {
                reserva = new ReservaRecursoDTO(re.getString(1), re.getString(2), re.getString(3), re.getString(4), re.getString(5), re.getInt(6));
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
        return reserva;
    }

    @Override
    public ArrayList<ReservaRecursoDTO> obtenerReservasRecurso() throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ArrayList<ReservaRecursoDTO> reserva = new ArrayList<>();

        try {
            stmt = conn.prepareStatement("SELECT * FROM reserva_recurso WHERE 1");
            ResultSet re = stmt.executeQuery();

            while (re.next()) {
                ReservaRecursoDTO dto = new ReservaRecursoDTO(re.getString(1), re.getString(2), re.getString(3), re.getString(4), re.getString(5));
                reserva.add(dto);
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
        return reserva;
    }

    @Override
    public boolean cancelarReservaRecurso(ReservaRecursoDTO dto) throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;

        try {
            stmt = conn.prepareStatement("DELETE FROM reserva_recurso WHERE nombre_recurso='" + dto.getNombreRecurso() + "' AND id_cliente= " + dto.getId_cliente() + " AND fecha_inicio='" + dto.getFecha_inicio() + "' AND fecha_salida='" + dto.getFecha_final() + "'");
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean modificarReservaRecurso(ReservaRecursoDTO dto, String nombreRecursoP, String fechaInicioP, String fechaFinP) throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;

        try {

            stmt = conn.prepareStatement("UPDATE reserva_recurso SET nombre_recurso=?, servicios=?, fecha_inicio=?, fecha_salida=? WHERE nombre_recurso = '" + nombreRecursoP + "' AND fecha_inicio = '" + fechaInicioP + "' AND fecha_salida = '" + fechaFinP + "'");
            stmt.setString(1, dto.getNombreRecurso());
            stmt.setString(2, dto.getServicios());
            stmt.setString(3, dto.getFecha_inicio());
            stmt.setString(4, dto.getFecha_final());
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

}
