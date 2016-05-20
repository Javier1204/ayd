/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.test;

import dao.HabitacionDAO;
import dto.HabitacionDTO;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javier
 */
public class testHabitacion {
    public static void main(String[] args) {
        HabitacionDAO dao = new HabitacionDAO();
        ArrayList<String> habitaciones= new ArrayList<>();
        String fecha="2015-04-10";
        java.util.Date date = new java.util.Date();
        String[] split = fecha.split("-");
        Date salida = new Date(Integer.parseInt(split[0]), Integer.parseInt(split[1]),Integer.parseInt(split[2]));
        Date entrada = new Date(date.getTime());
        try{
            habitaciones = dao.obtenerHabitacionesDisponibles(7, salida, entrada);
            for(String h : habitaciones){
                System.out.println(h);
            }
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
