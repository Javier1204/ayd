/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.cliente;

import dao.ClienteDAO;
import dao.ComentarioDAO;
import dto.ClienteDTO;
import dto.ComentarioDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class ControlCliente {
    
    
    public boolean validarCliente(String id) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        return cliente.validarCliente(id);
    }
    
    public boolean registrarCliente(String id_cliente, String nombre_cliente, String apellido, String telefono, String email, String procedencia) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        ClienteDTO dto = new ClienteDTO(id_cliente, nombre_cliente, apellido, telefono, email, procedencia);
        return cliente.registrarCliente(dto);
    }
    
    public ArrayList<ClienteDTO> obtenerClientes() throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        return cliente.obtenerClientes();
    }
    
    public ClienteDTO consultarCliente(String id) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        return cliente.consultarCliente(id);
    }
    
    public boolean modificarCliente(String id_cliente, String nombre_cliente, String apellido, String telefono, String email, String procedencia) throws Exception{
        ClienteDAO cliente = new ClienteDAO();
        ClienteDTO cli = new ClienteDTO(id_cliente, nombre_cliente, apellido, telefono, email, procedencia);
        return cliente.modificarCliente(cli);
    }
    
    public boolean eliminarCliente(String id) throws Exception{
        ClienteDAO cliente= new ClienteDAO();
        return cliente.eliminarCliente(id);
    }
    
    public boolean registrarComentario(String nick, String comentario)throws Exception{
        ComentarioDAO dao = new ComentarioDAO();
        java.util.Date date = new java.util.Date();
        Date fecha = new Date(date.getTime());
        ComentarioDTO dto = new ComentarioDTO(nick, comentario, fecha.toString());
        return dao.registrarComentario(dto);
    }
    
    public ArrayList<ComentarioDTO> obtenerComentarios() throws Exception{
        ComentarioDAO dao = new ComentarioDAO();
        return dao.obtenerComentarios();
    }
    
}
