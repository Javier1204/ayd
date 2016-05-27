/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HabitacionDTO;
import interfaces.IHabitacionDAO;
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
public class HabitacionDAO implements IHabitacionDAO {

    private Connection conn;

    @Override
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida, Date fecha_entrada) throws Exception {
        conn = Conexion.conectar();
        ArrayList<String> habitaciones = new ArrayList<>();
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT DISTINCT habitacion.id_habitacion FROM habitacion LEFT JOIN reserva ON "
                    + "habitacion.id_habitacion = reserva.id_habitacion INNER JOIN tipo ON habitacion.tipo = tipo.tipo "
                    + "WHERE habitacion.estado = 0 AND tipo.capacidad>" + cantPersonas + " AND (reserva.fecha_inicio>CAST('" + fecha_salida
                    + "' AS DATETIME) OR reserva.fecha_inicio IS NULL)");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                String hab = res.getString(1);
                habitaciones.add(hab);
            }
            stmt.close();
            res.close();
        } catch (SQLException ex) {
            habitaciones = null;
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(habitaciones.size());
        return habitaciones;
    }

    @Override
    public boolean ocuparHabitacion(String id_habitacion) throws Exception {
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {

            System.out.println("Entraos");
            stmt = conn.prepareStatement("UPDATE habitacion SET estado= 1 WHERE id_habitacion= ?");
            stmt.setString(1, id_habitacion);
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean desocuparHabitacion(String id_habitacion) throws Exception {
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {

            System.out.println("Entraos");
            stmt = conn.prepareStatement("UPDATE habitacion SET estado= 0 WHERE id_habitacion= ?");
            stmt.setString(1, id_habitacion);
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public HabitacionDTO consultarHabitacion(String id) throws Exception {
        conn = Conexion.conectar();
        HabitacionDTO habitacion = null;
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT * FROM habitacion WHERE id_habitacion='" + id + "'");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                habitacion = new HabitacionDTO(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getDouble(5), res.getBoolean(6));
            }
            stmt.close();
            res.close();
        } catch (SQLException ex) {
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return habitacion;
    }

    @Override
    public ArrayList<String> obtenerHabitacionesDisponiblesreserva(int cantPersonas, String fecha_salida, String fecha_entrada) throws Exception {
        conn = Conexion.conectar();
        ArrayList<String> habitaciones = new ArrayList();
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT DISTINCT habitacion.id_habitacion FROM habitacion, tipo WHERE habitacion.id_habitacion NOT IN "
                    + "(SELECT reserva.id_habitacion FROM reserva WHERE '" + fecha_entrada + "' BETWEEN reserva.fecha_inicio AND reserva.fecha_salida "
                    + "OR '" + fecha_salida + "' BETWEEN reserva.fecha_inicio AND reserva.fecha_salida OR reserva.fecha_inicio BETWEEN '" + fecha_entrada + "' AND '" + fecha_salida + "' "
                    + "OR reserva.fecha_salida BETWEEN '" + fecha_entrada + "' AND '" + fecha_salida + "') AND habitacion.tipo IN (SELECT tipo.tipo FROM tipo WHERE tipo.capacidad >=" + cantPersonas + ")");

            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                String room = res.getString(1);
                habitaciones.add(room);
            }
            stmt.close();
            res.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return habitaciones;
    }
}
