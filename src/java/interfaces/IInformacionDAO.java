/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;



/**
 *
 * @author FARID SANTIAGO
 */
public interface IInformacionDAO {
    
   
    public boolean modificarMision(String mision) throws Exception;
    public boolean modificarVision(String vision) throws Exception;
    public boolean modificarHistoria(String historia) throws Exception;
    public String mostrarMision() throws Exception;
    public String mostrarVision() throws Exception;
    public String mostrarHistoria() throws Exception;
}
