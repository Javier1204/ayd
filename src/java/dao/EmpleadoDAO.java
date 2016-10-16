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
            stmt = conn.prepareStatement("INSERT INTO empleado(cc, genero, nombre, apellido, lugar_nac, fecha_nac, direccion, fijo, celular, email, nivel_estudio, experiencia, cargo) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, dto.getCc());
            stmt.setString(2, dto.getGenero());
            stmt.setString(3, dto.getNombres());
            stmt.setString(4, dto.getApellidos());
            stmt.setString(5, dto.getLugar_nacimiento());
            stmt.setString(6, dto.getFecha_nacimiento());
            stmt.setString(7, dto.getDireccion());
            stmt.setString(8, dto.getFijo());
            stmt.setString(9, dto.getCelular());
            stmt.setString(10, dto.getEmail());
            stmt.setString(11, dto.getNivel_estudio());
            stmt.setInt(12, dto.getAnio_experiencia());
            stmt.setString(13, dto.getCargo());
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmpleadoDTO consultarEmpleado(String tipo, String dato) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    }

