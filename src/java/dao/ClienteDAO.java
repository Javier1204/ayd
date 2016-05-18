/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ClienteDTO;
import interfaces.IClienteDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class ClienteDAO implements IClienteDAO{

    private Connection conn = null;
    
    @Override
    public boolean registrarCliente(ClienteDTO dto) throws Exception{
        conn = Conexion.conectar();
        boolean exito =false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("INSERT INTO cliente(id_cliente, nombre, apellido, telefono, email, procedencia) values(?,?,?,?,?,?)");
            stmt.setString(1, dto.getId_cliente());
            stmt.setString(2, dto.getNombre_cliente());
            stmt.setString(3, dto.getApellido());
            stmt.setString(4, dto.getTelefono());
            stmt.setString(5, dto.getEmail());
            stmt.setString(6, dto.getProcedencia());
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
             stmt.close();
        }catch(Exception e){
          e.printStackTrace();
        }finally{
            if(conn != null){
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean modificarCliente(ClienteDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ClienteDTO consultarCliente(String id_cliente) {
        return null;
            }

    @Override
    public ArrayList<ClienteDTO> obtenerClientes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarCliente(String id_cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
