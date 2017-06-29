/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.recurso;

import dao.RecursoDAO;
import dao.ReservaRecursoDAO;
import dto.ReservaRecursoDTO;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class ControlRecurso {
    
    public boolean registrarReservaRecurso(String nombreRecurso, String servicios, String id_cliente, String fecha_inicio, String fecha_final) throws Exception{
        ReservaRecursoDAO dao = new ReservaRecursoDAO();
        ReservaRecursoDTO dto = new ReservaRecursoDTO(nombreRecurso, servicios, id_cliente, fecha_inicio, fecha_final);
        return dao.registrarReservaRecurso(dto);
    }
    
    public ArrayList<String> obtenerRecursosDisponibles(String fecha_entrada, String fecha_salida) throws Exception{
        RecursoDAO dao = new RecursoDAO();
        return dao.obtenerRecursosDisponibles(fecha_entrada, fecha_salida);   
    }
    
    public ArrayList<ReservaRecursoDTO> obtenerReservaRecurso() throws Exception{
        ReservaRecursoDAO dao = new ReservaRecursoDAO();
        return dao.obtenerReservasRecurso();
        
    }
    
    public ReservaRecursoDTO consultarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_entrada, String fecha_fin) throws Exception{
        ReservaRecursoDAO dao = new ReservaRecursoDAO();
        return dao.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_fin);
    }
    
    public boolean modificarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_entrada, String fecha_salida, String servicios, String nombreRecursoP, String fechaInicioP, String fechaFinP) throws Exception{
        ReservaRecursoDAO dao = new ReservaRecursoDAO();
        ReservaRecursoDTO dto = new ReservaRecursoDTO(nombre_recurso, servicios, id_cliente, fecha_entrada, fecha_salida);
        return dao.modificarReservaRecurso(dto, nombreRecursoP, fechaInicioP, fechaFinP);
    }
    
    public boolean cancelarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_entrada, String fecha_salida, String servicios) throws Exception{
        ReservaRecursoDAO dao = new ReservaRecursoDAO();
        ReservaRecursoDTO dto = new ReservaRecursoDTO(nombre_recurso, servicios, id_cliente, fecha_entrada, fecha_salida);
        return dao.cancelarReservaRecurso(dto);
    }
    
    public String obtenerTarifaRecurso(String nombre_recurso) throws Exception{
        RecursoDAO dao = new RecursoDAO();
        return dao.obtenerTarifaRecurso(nombre_recurso);
    }
}
