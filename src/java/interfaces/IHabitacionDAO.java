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
    public ArrayList<HabitacionDTO> obtenerHabitacionesDisponibles(int cantPersonas, Date fecha_salida, Date fecha_entrada);
    public boolean ocuparHabitacion(String id_habitacion);
    public boolean desocuparHabitacion(String id_habitacion);
}
