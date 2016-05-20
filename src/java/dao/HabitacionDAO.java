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
public class HabitacionDAO implements IHabitacionDAO{

    private Connection conn;
    
    @Override
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, Date fecha_salida, Date fecha_entrada) throws Exception {
        conn = Conexion.conectar();
        ArrayList<String> habitaciones = new ArrayList<>();
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("SELECT habitacion.id_habitacion FROM habitacion LEFT JOIN reserva ON "
                    + "habitacion.id_habitacion = reserva.id_habitacion INNER JOIN tipo ON habitacion.tipo = tipo.tipo "
                    + "WHERE habitacion.estado = 0 AND tipo.capacidad>"+cantPersonas+" AND (reserva.fecha_inicio >"+fecha_salida
                    + " OR reserva.fecha_inicio IS NULL)");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                String hab = res.getString(1);
                habitaciones.add(hab);
            }
            stmt.close();
            res.close();
        }catch (SQLException ex) {
            habitaciones = null;
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return habitaciones;
    }

    @Override
    public boolean ocuparHabitacion(String id_habitacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean desocuparHabitacion(String id_habitacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
