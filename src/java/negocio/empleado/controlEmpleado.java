/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.empleado;

import dao.EmpleadoDAO;
import dto.EmpleadoDTO;

/**
 *
 * @author FARID SANTIAGO
 */
public class controlEmpleado {
    
    
    public boolean registrarEmpleado(String nombres, String apellidos, String cc, String cargo, String lugar_nacimiento, String fecha_nacimiento, String nivel_estudio, String direccion, String celular, String fijo, String email, String genero, int anio_experiencia) throws Exception{
        EmpleadoDAO empleado = new EmpleadoDAO();
        EmpleadoDTO dto = new EmpleadoDTO(nombres, apellidos, cc, cargo, lugar_nacimiento, fecha_nacimiento, nivel_estudio, direccion, celular, fijo, email, genero, anio_experiencia);
        return empleado.registrarEmpleado(dto);
    }
}
