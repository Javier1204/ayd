/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.test;

import dao.HabitacionDAO;
import dto.HabitacionDTO;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javier
 */
public class testHabitacion {
    
    public static void obtener(){
            HabitacionDAO dao = new HabitacionDAO();
        ArrayList<String> habitaciones= new ArrayList<>();
        String fecha="2016-05-19";
        java.util.Date date = new java.util.Date();
        Date entrada = new Date(date.getTime());
        try{
            habitaciones = dao.obtenerHabitacionesDisponibles(1, fecha, entrada);
            for(String h : habitaciones){
                System.out.println(h);
            }
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void consultar(){
        HabitacionDAO dao = new HabitacionDAO();
        try{
            HabitacionDTO dto = dao.consultarHabitacion("203");
            System.out.println(dto);
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        consultar();
    }
}
