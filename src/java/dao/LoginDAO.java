/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import interfaces.ILoginDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Conexion;

/**
 *
 * @author Javier
 */
public class LoginDAO implements ILoginDAO{

    Connection conn = null;    
    
    @Override
    public boolean validarUsuario(String user, String password, String tipoUsuario) throws Exception {
        conn = Conexion.conectar();
        boolean exito= false;
        PreparedStatement stmt=null;
        try{
          stmt = conn.prepareStatement("SELECT * FROM admin WHERE nombreUsuario='"+user+"' AND password='"+password+"' AND rol='"+tipoUsuario+"'");
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                String u = res.getString(1);
                System.out.println(u);
                String r = res.getString(2);
                String p = res.getString(3);
                System.out.println(p);
                if(u.equalsIgnoreCase(user) && r.equalsIgnoreCase(tipoUsuario) && p.equalsIgnoreCase(password)){
                    exito = true;
                }
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
        return exito;
    }
    
}
