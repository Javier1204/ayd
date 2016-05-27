/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.reserva;

import dao.*;
import dto.ReservaDTO;
import java.util.*;

/**
 *
 * @author Javier
 */
public class ControlReserva {

    public ArrayList<String> consultarHabitacionesDisponiblesReserva(int cant, String fecha_salida, String fecha_entrada) throws Exception {
        HabitacionDAO dao = new HabitacionDAO();
        return dao.obtenerHabitacionesDisponiblesreserva(cant, fecha_salida, fecha_entrada);
    }
    
    public String obtenerUltimaIDReserva() throws Exception{
        return null;
    }
    
    public boolean registrarReserva(ReservaDTO dto) throws Exception{
        ReservaDAO dao = new ReservaDAO();
        return dao.registrarReserva(new ReservaDTO(dto.getId_habitacion(), dto.getId_cliente(), dto.getCantPersonas(), dto.getFecha_inicio(), dto.getFecha_salida(), dto.getNombreCliente(), dto.getTelefono(), dto.getEmail(), dto.getApellido(), dto.getProcedencia()));
    }
}
