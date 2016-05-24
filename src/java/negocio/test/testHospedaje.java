/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.test;

import dao.HospedajeDAO;
import dto.HospedajeDTO;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javier
 */
public class testHospedaje {
    
    public static void registrarHospedaje(){
         HospedajeDAO hospedaje = new HospedajeDAO();
        java.util.Date date = new java.util.Date();
        Date entrada = new Date(date.getTime());
        HospedajeDTO dto = new HospedajeDTO("101", 2, "1090495", "2016-05-17", entrada.toString());
        try{
            boolean exito= hospedaje.registrarHospedaje(dto);
            System.out.println(exito);
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void consultarHospedaje(){
         HospedajeDAO hospedaje = new HospedajeDAO();
        try{
            HospedajeDTO dto = hospedaje.consultarHospedajeActivo("1090", "107");
            System.out.println(dto);
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void consultarHospedajeA(){
         HospedajeDAO hospedaje = new HospedajeDAO();
        try{
            ArrayList<HospedajeDTO> dto = hospedaje.mostrarHospedajesActivo();
            System.out.println(dto.size());
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void modificarHospedaje(){
        HospedajeDAO hospedaje = new HospedajeDAO();
        try{
            HospedajeDTO dto = new HospedajeDTO("103", 4, "1090", "2016-05-26", "2016-05-20");
            boolean exito =hospedaje.modificarHospedaje(dto, "210");
            System.out.println(exito);
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        
       modificarHospedaje();
    }
}
