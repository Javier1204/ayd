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
            stmt.setDate(4, dto.getFecha_salida());
            stmt.setDate(5, dto.getFecha_entrada());
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
    public boolean modificarHospedaje(HospedajeDTO dto, String id_habAnterior) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean finalizarHospedaje(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public HospedajeDTO consultarHospedaje(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public HospedajeDTO consultarHospedajeActivo(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<HospedajeDTO> mostrarHospedajes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
