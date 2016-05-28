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
    
    public boolean registrarReservaRecurso(ReservaRecursoDTO dto) throws Exception;
    public ReservaRecursoDTO consultarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_inicio, String fecha_fin) throws Exception;
    public ArrayList<ReservaRecursoDTO> obtenerReservasRecurso() throws Exception;
    public boolean cancelarReservaRecurso(ReservaRecursoDTO dto) throws Exception;
    public boolean modificarReservaRecurso(ReservaRecursoDTO dto, String nombreRecursoP, String fechaInicioP, String fechaFinP) throws Exception;
}
