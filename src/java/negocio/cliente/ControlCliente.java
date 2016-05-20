/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.cliente;

import dao.ClienteDAO;
import dto.ClienteDTO;

/**
 *
 * @author Javier
 */
public class ControlCliente {
    
    public ClienteDTO consultarCliente(String id) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        return cliente.consultarCliente(id);
    }
    
    public boolean validarCliente(String id) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        return cliente.validarCliente(id);
    }
    
}
