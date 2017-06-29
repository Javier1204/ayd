/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.ClienteDTO;
import dto.ComentarioDTO;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IClienteDAO {
    
    public boolean registrarCliente(ClienteDTO dto) throws Exception;
    public boolean modificarCliente(ClienteDTO dto) throws Exception;
    public ClienteDTO consultarCliente(String id_cliente)throws Exception;
    public ArrayList<ClienteDTO> obtenerClientes()throws Exception;
    public boolean eliminarCliente(String id_cliente)throws Exception;
    public boolean validarCliente(String id_cliente) throws Exception;
    
}
