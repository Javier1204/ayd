/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ComentarioDTO;
import interfaces.IComentarioDAO;
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
public class ComentarioDAO implements IComentarioDAO{
    
    private Connection conn = null;
        
    @Override
    public boolean registrarComentario(ComentarioDTO comentario) throws Exception{
        conn= Conexion.conectar();
        boolean exito=false;
        PreparedStatement stmt=null;
        try{
            stmt= conn.prepareCall("INSERT INTO comentario(nick, texto, fecha) VALUES(?,?,?)");
            stmt.setString(1, comentario.getNick());
            stmt.setString(2, comentario.getComentario());
            stmt.setString(3, comentario.getFecha());
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
            stmt.close();
        } catch (SQLException ex) {
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public ArrayList<ComentarioDTO> obtenerComentarios() throws Exception {
        conn = Conexion.conectar();
        PreparedStatement stmt = null;
        ArrayList<ComentarioDTO> comentarios=new ArrayList<>();
        try{
            stmt = conn.prepareStatement("SELECT * FROM comentario WHERE 1");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                ComentarioDTO dto = new ComentarioDTO(res.getString(1), res.getString(2), res.getString(3));
                comentarios.add(dto);
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
        return comentarios;
    }
    
}
