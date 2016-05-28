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
    public ArrayList<String> obtenerRecursosDisponibles(String fecha_salida, String fecha_entrada)throws Exception;
    public String obtenerTarifaRecurso(String nombre_recurso) throws Exception;
}
