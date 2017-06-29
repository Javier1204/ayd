/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.EmpleadoDTO;
import java.util.ArrayList;

/**
 *
 * @author FARID SANTIAGO
 */
public interface IEmpleadoDAO {
    
    public boolean registrarEmpleado(EmpleadoDTO dto) throws Exception;
    public boolean modificarEmpleado(EmpleadoDTO dto) throws Exception;
    public ArrayList<EmpleadoDTO> consultarEmpleado(String tipo, String dato) throws Exception;
}
