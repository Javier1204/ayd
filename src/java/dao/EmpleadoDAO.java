/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmpleadoDTO;
import interfaces.IEmpleadoDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.Conexion;

/**
 *
 * @author FARID SANTIAGO
 */
public class EmpleadoDAO implements IEmpleadoDAO{

    private Connection conn = null;
    @Override
    public boolean registrarEmpleado(EmpleadoDTO dto) throws Exception {
       conn = Conexion.conectar();
        boolean exito =false;
        PreparedStatement stmt = null;
        try{
            stmt = conn.prepareStatement("INSERT INTO empleado(nombres, apellidos, cc, cargo, lugar_nacimiento, fecha_nacimiento, nivel_estudio, direccion, celular, fijo, email, genero, anio_experiencia) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, dto.getNombres());
            stmt.setString(2, dto.getApellidos());
            stmt.setString(3, dto.getCc());
            stmt.setString(4, dto.getCargo());
            stmt.setString(5, dto.getLugar_nacimiento());
            stmt.setString(6, dto.getFecha_nacimiento());
            stmt.setString(7, dto.getNivel_estudio());
            stmt.setString(8, dto.getDireccion());
            stmt.setString(9, dto.getCelular());
            stmt.setString(10, dto.getFijo());
            stmt.setString(11, dto.getEmail());
            stmt.setString(12, dto.getGenero());
            stmt.setInt(13, dto.getAnio_experiencia());
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
    public boolean modificarEmpleado(EmpleadoDTO dto) throws Exception {
      conn = Conexion.conectar();
        PreparedStatement stmt = null;
        boolean exito = false;
        try {
            stmt = conn.prepareStatement("UPDATE empleado SET nombres=?,apellidos=?,cargo=?,nivel_estudio=?,direccion=?,celular=?,fijo=?,email=?,anio_experiencia=? WHERE cc='"+dto.getCc()+"'");
            stmt.setString(1, dto.getNombres());
            stmt.setString(2, dto.getApellidos());
            stmt.setString(3, dto.getCargo());
            stmt.setString(4, dto.getNivel_estudio());
            stmt.setString(5, dto.getDireccion());
            stmt.setString(6, dto.getCelular());
            stmt.setString(7, dto.getFijo());
            stmt.setString(8, dto.getEmail());
            stmt.setInt(9, dto.getAnio_experiencia());
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
    public ArrayList<EmpleadoDTO> consultarEmpleado(String tipo, String dato) throws Exception {
      ArrayList<EmpleadoDTO> list = new ArrayList();
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        EmpleadoDTO empleado = null;
        try {
            if (tipo.equals("nombre")) {
                stmt = conn.prepareStatement("SELECT * FROM empleado WHERE nombres LIKE '%"+ dato+"%'");
                ResultSet res = stmt.executeQuery();
                while (res.next()) {
                    empleado = new EmpleadoDTO(res.getString(1), res.getString(2), res.getString(3), res.getString(4), res.getString(8), res.getString(9), res.getString(10), res.getString(11), res.getInt(13));
                    list.add(empleado);
                }
                stmt.close();
                res.close();
            } else if (tipo.equals("cc")) {
                stmt = conn.prepareStatement("SELECT * FROM empleado WHERE cc="+ dato);
                ResultSet res = stmt.executeQuery();
                while (res.next()) {
                    empleado = new EmpleadoDTO();
                    empleado.setCc(res.getString(3));
                    empleado.setNombres(res.getString(1));
                    empleado.setApellidos(res.getString(2));
                    empleado.setDireccion(res.getString(8));
                    empleado.setNivel_estudio(res.getString(7));
                    empleado.setCelular(res.getString(9));
                    empleado.setFijo(res.getString(10));
                    empleado.setEmail(res.getString(11));
                    empleado.setCargo(res.getString(4));
                    empleado.setAnio_experiencia(res.getInt(13));
                    empleado.setCargo(res.getString(4));                  
                    list.add(empleado);
                }
                stmt.close();
                res.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    }

