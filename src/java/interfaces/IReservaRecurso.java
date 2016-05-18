/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.ReservaRecursoDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IReservaRecurso {
    
    public boolean registrarReservaRecurso(ReservaRecursoDTO dto);
    public ReservaRecursoDTO consultarReservaRecurso(String nombre_recurso, String id_cliente, Date fecha_inicio);
    public ArrayList<ReservaRecursoDTO> obtenerReservasRecurso();
    public boolean cancelarReservaRecurso(String nombre_recurso, String id_cliente, Date fecha_inicio);
    public ArrayList<ReservaRecursoDTO> obtenerReservasPendientes();
}
