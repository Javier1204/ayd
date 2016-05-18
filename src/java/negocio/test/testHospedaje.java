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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javier
 */
public class testHospedaje {
    public static void main(String[] args) {
        java.util.Date date = new java.util.Date();
        Date salida = new Date(15, 04, 19);
        Date entrada = new Date(date.getTime());
        HospedajeDAO hospedaje = new HospedajeDAO();
        HospedajeDTO dto = new HospedajeDTO("202", 2, "1090495", salida, entrada);
        try{
            boolean exito= hospedaje.registrarHospedaje(dto);
            System.out.println(exito);
        }catch(Exception ex){
            Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
