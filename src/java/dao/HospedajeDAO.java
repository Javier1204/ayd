/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HospedajeDTO;
import interfaces.IHospedajeDAO;
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
public class HospedajeDAO implements IHospedajeDAO{
    
    private Connection conn;

    @Override
    public boolean registrarHospedaje(HospedajeDTO dto) throws Exception {
        conn = Conexion.conectar();
        boolean exito=false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("INSERT INTO hospedaje(id_habitacion, cantPersonas, id_cliente, fecha_salida, fecha_inicio)"
                    + " VALUES(?,?,?,?,?)");
            stmt.setString(1, dto.getId_habitacion());
            stmt.setInt(2, dto.getCantPersonas());
            stmt.setString(3, dto.getId_cliente());
            stmt.setString(4, dto.getFecha_salida());
            stmt.setString(5, dto.getFecha_entrada());
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
             stmt.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(conn != null){
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean modificarHospedaje(HospedajeDTO dto, String id_habAnterior) throws Exception{
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;
        try {
            stmt = conn.prepareStatement("UPDATE hospedaje SET id_habitacion=?, fecha_salida=?, cantPersonas=? WHERE id_habitacion="+id_habAnterior);
            stmt.setString(1, dto.getId_habitacion());
            stmt.setString(2, dto.getFecha_salida());
            stmt.setInt(3, dto.getCantPersonas());
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
    public boolean finalizarHospedaje(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public HospedajeDTO consultarHospedaje(String id_cliente, String fecha_salida, String fecha_entrada) throws Exception{
         conn = Conexion.conectar();
        PreparedStatement stmt = null;
        HospedajeDTO hospedaje=null;
        try{
            stmt = conn.prepareStatement("SELECT * FROM hospedaje WHERE id_cliente='"+id_cliente
                    +"' AND fecha_salida='"+fecha_salida+"' AND fecha_inicio='"+fecha_entrada+"'");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                hospedaje = new HospedajeDTO(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),res.getString(6));
                
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
        return hospedaje;
    }

    @Override
    public HospedajeDTO consultarHospedajeActivo(String id_cliente, String id_habitacion) throws Exception{
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        HospedajeDTO hospedaje=null;
        try{
            stmt = conn.prepareStatement("SELECT * FROM hospedaje WHERE id_cliente='"+id_cliente
                    +"' AND id_habitacion='"+id_habitacion+"' AND fecha_salida > (CURRENT_TIMESTAMP)");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                hospedaje = new HospedajeDTO(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),res.getString(6));
                
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
        return hospedaje;
    }

    @Override
    public ArrayList<HospedajeDTO> mostrarHospedajes() throws Exception{
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ArrayList<HospedajeDTO> hospedajes=new ArrayList<>();
        try{
            stmt = conn.prepareStatement("SELECT * FROM hospedaje WHERE 1");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                HospedajeDTO dto = new HospedajeDTO(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),res.getString(6));
                hospedajes.add(dto);
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
        return hospedajes;
    }

    @Override
    public ArrayList<HospedajeDTO> mostrarHospedajesActivo() throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ArrayList<HospedajeDTO> hospedajes=new ArrayList<>();
        try{
            stmt = conn.prepareStatement("SELECT * FROM hospedaje WHERE fecha_salida > (CURRENT_TIMESTAMP)");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                HospedajeDTO dto = new HospedajeDTO(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),res.getString(6));
                hospedajes.add(dto);
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
        return hospedajes;
    }
    
}
