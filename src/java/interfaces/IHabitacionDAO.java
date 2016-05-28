/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.HabitacionDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IHabitacionDAO {
    
    public HabitacionDTO consultarHabitacion(String id) throws Exception;
    public ArrayList<String> obtenerHabitacionesDisponiblesreserva(int cantPersonas, String fecha_salida, String fecha_entrada) throws Exception;
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida, Date fecha_entrada) throws Exception;
    public boolean ocuparHabitacion(String id_habitacion) throws Exception;
    public boolean desocuparHabitacion(String id_habitacion) throws Exception;
    public ArrayList<HabitacionDTO> obtenerHabitaciones() throws Exception;
}
