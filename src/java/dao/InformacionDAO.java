/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import interfaces.IInformacionDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Conexion;

/**
 *
 * @author FARID SANTIAGO
 */
public class InformacionDAO implements IInformacionDAO{
    
    private Connection conn;

    @Override
    public boolean modificarMision(String mision) throws Exception {
       conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try{
 
            stmt = conn.prepareStatement("UPDATE hotel_info SET hotel_mision=? WHERE 1");
            stmt.setString(1, mision);
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean modificarVision(String vision) throws Exception {
       conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("UPDATE hotel_info SET hotel_vision=? WHERE 1");
            stmt.setString(1, vision);
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean modificarHistoria(String historia) throws Exception {
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("UPDATE hotel_info SET hotel_historia=? WHERE 1");
            stmt.setString(1, historia);
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public String mostrarMision() throws Exception {
          conn = Conexion.conectar();
        String mision = "";
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT hotel_mision FROM hotel_info WHERE 1");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                mision = rs.getString(1);
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return mision;
    }

    @Override
    public String mostrarVision() throws Exception {
        conn = Conexion.conectar();
        String vision = "";
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT hotel_vision FROM hotel_info WHERE 1");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                vision = rs.getString(1);
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return vision;
    }

    @Override
    public String mostrarHistoria() throws Exception {
        conn = Conexion.conectar();
        String historia = "";
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT hotel_historia FROM hotel_info WHERE 1");
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                historia = rs.getString(1);
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return historia;
    }
    
}
