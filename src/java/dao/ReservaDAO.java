/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ReservaDTO;
import interfaces.IReservaDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class ReservaDAO implements IReservaDAO {

    private Connection conn;

    @Override
    public boolean registrarReserva(ReservaDTO dto) throws Exception {
        System.out.println("Entró a hacer reserva");
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("INSERT INTO `reserva` (`id_habitacion`, `id_cliente`, `cantPersonas`, `fecha_inicio`, "
                    + "`fecha_salida`, `nombre_cliente`, `telefono`, `email`, `apellido_cliente`, `id_reserva`) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, dto.getId_habitacion());
            stmt.setString(2, dto.getId_cliente());
            stmt.setInt(3, dto.getCantPersonas());
            stmt.setString(4, dto.getFecha_inicio());
            stmt.setString(5, dto.getFecha_salida());
            stmt.setString(6, dto.getNombreCliente());
            stmt.setString(7, dto.getTelefono());
            stmt.setString(8, dto.getEmail());
            stmt.setString(9, dto.getApellido_Cliente());
            stmt.setString(10, dto.getId_reserva());
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
            stmt.close();
            System.out.println("cerró stmt");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println("por qué vergas no sirve.png");
        return exito;
    }

    @Override
    public ReservaDTO consultarReserva(String id) throws Exception {
        ReservaDTO dto = null;
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT * FROM `reserva` WHERE id_cliente = " + id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dto = new ReservaDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
            stmt.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }

    @Override
    public ArrayList<ReservaDTO> obtenerReservas() throws Exception {
        ArrayList<ReservaDTO> dtos = new ArrayList();
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("SELECT * FROM `reserva`");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dtos.add(new ReservaDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return dtos;
    }

    @Override
    public boolean cancelarReserva(String id_reserva) throws Exception {
        conn = Conexion.conectar();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("DELETE FROM `reserva` WHERE `reserva`.`id_reserva` = '"+ id_reserva +"'");

            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public ArrayList<ReservaDTO> obtenerReservasPendientes() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean pagarReserva(String id) throws Exception{
        return false;
    }
}
