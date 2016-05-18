/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.RecursoDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IRecursoDAO {
    public ArrayList<RecursoDTO> obtenerHabitacionesDisponibles(Date fecha_salida, Date fecha_entrada);
    
}
