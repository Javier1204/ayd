/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.test;

import dao.ClienteDAO;
import dto.ClienteDTO;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javier
 */
public class testCliente {
    public static void registrarCliente(){
        ClienteDAO cliente = new ClienteDAO();
        ClienteDTO dto = new ClienteDTO("109344", "Javix", "Flowers", "5848092", "javier12@gmail.com", "Cúcuta");
        try{
            boolean exito = cliente.registrarCliente(dto);
            System.out.println(exito);
        }catch (Exception ex){
             Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void validarCliente(String id_cliente){
        ClienteDAO cliente = new ClienteDAO();
        try{
            boolean exito = cliente.validarCliente(id_cliente);
            System.out.println(exito);
        }catch (Exception ex){
             Logger.getLogger(testHospedaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        validarCliente("1090495");
    }
    
}
