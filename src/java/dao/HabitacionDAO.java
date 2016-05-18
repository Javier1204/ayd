/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HabitacionDTO;
import interfaces.IHabitacionDAO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class HabitacionDAO implements IHabitacionDAO{

    @Override
    public ArrayList<HabitacionDTO> obtenerHabitacionesDisponibles(int cantPersonas, Date fecha_salida, Date fecha_entrada) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
