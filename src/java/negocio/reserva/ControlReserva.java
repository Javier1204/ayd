/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.reserva;

import dao.*;
import dto.ReservaDTO;
import java.security.SecureRandom;
import java.util.*;

/**
 *
 * @author Javier
 */
public class ControlReserva {

    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    String randomString(int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }

    public ArrayList<String> consultarHabitacionesDisponiblesReserva(int cant, String fecha_salida, String fecha_entrada) throws Exception {
        HabitacionDAO dao = new HabitacionDAO();
        return dao.obtenerHabitacionesDisponiblesreserva(cant, fecha_salida, fecha_entrada);
    }

    public ArrayList<ReservaDTO> obtenerReservas() throws Exception{
        ReservaDAO dao = new ReservaDAO();
        return dao.obtenerReservas();
    }

    public boolean registrarReserva(String id_habitacion, String id_cliente, int cantPersonas, String fecha_inicio, String fecha_salida, String nombreCliente, String telefono, String email, String apellido) throws Exception {
        ReservaDAO dao = new ReservaDAO();
        String str = randomString(3);
        ReservaDTO dto = new ReservaDTO(id_habitacion, id_cliente, cantPersonas, fecha_inicio, fecha_salida, nombreCliente, telefono, email, apellido, str);
        return dao.registrarReserva(dto);
    }
    
    public ReservaDTO consultarReserva(String id_cliente) throws Exception{
        ReservaDAO dao = new ReservaDAO();
        return dao.consultarReserva(id_cliente);
    }
    
    public boolean cancelarReserva(String id_reserva) throws Exception{
        ReservaDAO dao = new ReservaDAO();
        return dao.cancelarReserva(id_reserva);
    }
}
