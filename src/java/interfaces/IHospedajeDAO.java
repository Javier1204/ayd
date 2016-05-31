/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.HospedajeDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IHospedajeDAO {
    
    public boolean registrarHospedaje(HospedajeDTO dto) throws Exception;
    public boolean modificarHospedaje(HospedajeDTO dto, String id_habAnterior) throws Exception;
    public boolean finalizarHospedaje(String id_cliente, String id, String fechaNueva, String fecha_salida, String fecha_entrada) throws Exception;
    public HospedajeDTO consultarHospedaje(String id_cliente, String fecha_entrada, String fecha_salida) throws Exception;
    public HospedajeDTO consultarHospedajeActivo(String id_cliente, String id_habitacion) throws Exception;
    public ArrayList<HospedajeDTO> mostrarHospedajesActivo() throws Exception;
    public ArrayList<HospedajeDTO> mostrarHospedajes() throws Exception;
}
