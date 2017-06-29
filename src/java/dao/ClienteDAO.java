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
import java.sql.ResultSet;
import java.sql.SQLException;
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
    public boolean modificarCliente(ClienteDTO dto) throws Exception{
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;
        try {
            stmt = conn.prepareStatement("UPDATE cliente SET nombre=?,apellido=?,telefono=?,email=?,procedencia=? WHERE id_cliente='"+dto.getId_cliente()+"'");
            stmt.setString(1, dto.getNombre_cliente());
            stmt.setString(2, dto.getApellido());
            stmt.setString(3, dto.getTelefono());
            stmt.setString(4, dto.getEmail());
            stmt.setString(5, dto.getProcedencia());
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public ClienteDTO consultarCliente(String id_cliente) throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ClienteDTO cliente=null;
        try{
            stmt = conn.prepareStatement("SELECT * FROM cliente WHERE id_cliente="+id_cliente);
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                cliente = new ClienteDTO(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6));
            }
            stmt.close();
            res.close();
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return cliente;
    }

    @Override
    public ArrayList<ClienteDTO> obtenerClientes() throws Exception {
        conn = Conexion.conectar();
        ArrayList<ClienteDTO> clientes = new ArrayList<>();
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("SELECT * FROM cliente WHERE 1");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                ClienteDTO cliente = new ClienteDTO(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6));
                clientes.add(cliente);
            }
            stmt.close();
            res.close();
        }catch (SQLException ex) {
            clientes = null;
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return clientes;
    }

    @Override
    public boolean eliminarCliente(String id_cliente) throws Exception{
         conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;
        
        try{
            stmt = conn.prepareStatement("DELETE FROM cliente WHERE id_cliente='"+id_cliente+"'");
            int total = stmt.executeUpdate();
            if(total > 0){
                exito = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean validarCliente(String id_cliente) throws Exception {
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("SELECT id_cliente FROM cliente WHERE id_cliente="+id_cliente);
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                exito = true;
            }
            stmt.close();
            res.close();
        }catch (SQLException ex) {
            exito = false;
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }
    
}
