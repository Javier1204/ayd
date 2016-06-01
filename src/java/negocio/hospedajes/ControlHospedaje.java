/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.hospedajes;

import dao.HabitacionDAO;
import dao.HospedajeDAO;
import dto.HabitacionDTO;
import dto.HospedajeDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class ControlHospedaje {
    
    public boolean registrarHospedaje(String id_habitacion,String cantPersonas, String id_cliente, String fecha_salida) throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        HabitacionDAO est = new HabitacionDAO();
        java.util.Date date = new java.util.Date();
        Date entrada = new Date(date.getTime());
        int cant = Integer.parseInt(cantPersonas);
        HospedajeDTO dto = new HospedajeDTO(id_habitacion, cant, id_cliente, fecha_salida, entrada.toString());
        est.ocuparHabitacion(id_habitacion);
        return dao.registrarHospedaje(dto);
    }
    
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida) throws Exception{
        HabitacionDAO dao = new HabitacionDAO();
        java.util.Date date = new java.util.Date();
        Date entrada = new Date(date.getTime());
        return dao.obtenerHabitacionesDisponibles(cantPersonas, fecha_salida, entrada);
    }
    
    public ArrayList<HospedajeDTO> obtenerHospedajes() throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        return dao.mostrarHospedajes();
    }
    
    public ArrayList<HospedajeDTO> obtenerHospedajesActivos() throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        return dao.mostrarHospedajesActivo();
    }
    
    public HospedajeDTO consultarHospedaje(String id_cliente, String f_salida, String f_entrada) throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        return dao.consultarHospedaje(id_cliente, f_salida, f_entrada);
    }
   
    public HospedajeDTO consultarHospedajeActivo(String id_cliente, String id_habitacion) throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        return dao.consultarHospedajeActivo(id_cliente, id_habitacion);
    }
    
    public boolean modificarHospedaje(String id_habitacion,String cantPersonas, String id_cliente, String fecha_salida, String habAnt, String id) throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        HabitacionDAO hab = new HabitacionDAO();
        int cant = Integer.parseInt(cantPersonas);
        int id_h= Integer.parseInt(id);
        HospedajeDTO dto = new HospedajeDTO(id_habitacion, cant, id_cliente, fecha_salida, fecha_salida);
        hab.desocuparHabitacion(habAnt);
        hab.ocuparHabitacion(id_habitacion);
        return dao.modificarHospedaje(dto, habAnt, id_h);
    }
    
    public HabitacionDTO consultarHabitacion(String id) throws Exception{
        HabitacionDAO dao = new HabitacionDAO();
        return dao.consultarHabitacion(id);
    }
    
    public ArrayList<HabitacionDTO> obtenerHabitaciones() throws Exception{
        HabitacionDAO dao = new HabitacionDAO();
        return dao.obtenerHabitaciones();
    }
    
    public boolean finalizarHospedaje(String id_cliente, String idHab,String fecha_salida, String fecha_entrada) throws Exception{
        HabitacionDAO dao = new HabitacionDAO();
        HospedajeDAO da = new HospedajeDAO();
        java.util.Date date = new java.util.Date();
        Date fecha = new Date(date.getTime());
        dao.desocuparHabitacion(idHab);
        return da.finalizarHospedaje(id_cliente, idHab, fecha.toString(), fecha_salida,fecha_entrada);
    }
    
}
