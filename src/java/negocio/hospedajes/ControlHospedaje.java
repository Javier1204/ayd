/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.hospedajes;

import dao.HabitacionDAO;
import dao.HospedajeDAO;
import dto.HospedajeDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class ControlHospedaje {
    
    public boolean registrarHospedaje(String id_habitacion,int cantPersonas, String id_cliente, Date fecha_salida, Date fecha_entrada) throws Exception{
        HospedajeDAO dao = new HospedajeDAO();
        HospedajeDTO dto = new HospedajeDTO(id_habitacion, cantPersonas, id_cliente, fecha_salida, fecha_entrada);
        return dao.registrarHospedaje(dto);
    }
    
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida) throws Exception{
        HabitacionDAO dao = new HabitacionDAO();
        String[] split= fecha_salida.split("-");
        java.util.Date date = new java.util.Date();
        Date salida = new Date(Integer.parseInt(split[0]), Integer.parseInt(split[1]),Integer.parseInt(split[2]));
        Date entrada = new Date(date.getTime());
        return dao.obtenerHabitacionesDisponibles(cantPersonas, salida, entrada);
    }
}
