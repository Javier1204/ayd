/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import dto.ClienteDTO;
import java.util.ArrayList;
import javax.json.JsonObject;
import negocio.cliente.ControlCliente;
import negocio.hospedajes.ControlHospedaje;

/**
 *
 * @author Javier
 */
public class Fachada {
    
    public ClienteDTO consultarCliente(String id)throws Exception{
        ControlCliente cliente = new ControlCliente();
        return cliente.consultarCliente(id);
    }
    
    public boolean validarCliente(String id) throws Exception{
        ControlCliente cliente = new ControlCliente();
        return cliente.validarCliente(id);
    }
    
    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida) throws Exception{
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.obtenerHabitacionesDisponibles(cantPersonas, fecha_salida);
    }
    
}
