/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RecursoDTO;
import interfaces.IRecursoDAO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class RecursoDAO implements IRecursoDAO{

     private Connection conn;
    @Override
    public ArrayList<String> obtenerRecursosDisponibles(String fecha_entrada, String fecha_salida) throws Exception{
        conn = Conexion.conectar();
        ArrayList<String> recursos = new ArrayList<>();
        PreparedStatement stmt = null;
        
        try{
            stmt = conn.prepareStatement("SELECT recurso.nombre FROM recurso WHERE recurso.nombre NOT IN(SELECT nombre_recurso FROM recurso r, reserva_recurso s "
                    + "WHERE '"+fecha_entrada+"' BETWEEN s.fecha_inicio AND s.fecha_salida OR '"+fecha_salida+"' BETWEEN s.fecha_inicio AND s.fecha_salida OR s.fecha_inicio "
                    + "BETWEEN '"+fecha_entrada+"' AND '"+fecha_salida+"' OR s.fecha_salida BETWEEN '"+fecha_entrada+"' AND '"+fecha_salida+"')");
            ResultSet res = stmt.executeQuery();
            while (res.next()){
                String rec = res.getString(1);
                recursos.add(rec);
            }
            stmt.close();
            res.close();
        }catch(SQLException e){
            recursos = null;
            throw new Exception(e);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
        return recursos;
    }

    @Override
    public String obtenerTarifaRecurso(String nombre_recurso) throws Exception {
         conn = Conexion.conectar();
         PreparedStatement stmt = null;
         String tarifa = "";
         
         try{
             stmt = conn.prepareStatement("SELECT tarifa FROM recurso WHERE nombre='"+nombre_recurso+"'");
             ResultSet re = stmt.executeQuery();
             while(re.next()){
                 tarifa = re.getString(1);
             }
             stmt.close();
             re.close();
         }catch(SQLException e){
             e.printStackTrace();
         }finally{
             if(conn!=null){
                 conn.close();
             }
         }
         return tarifa;
    }
    
    
    
}
