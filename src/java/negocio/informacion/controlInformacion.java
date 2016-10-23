/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.informacion;

import dao.InformacionDAO;


/**
 *
 * @author FARID SANTIAGO
 */
public class controlInformacion {
    
    public boolean actualizarMision(String mision) throws Exception{
        InformacionDAO info = new InformacionDAO();
        return info.modificarMision(mision);
            
    }
    public boolean actualizarVision(String vision) throws Exception{
        InformacionDAO info = new InformacionDAO();
        return info.modificarVision(vision);
            
    }
    public boolean actualizarHistoria(String historia) throws Exception{
        InformacionDAO info = new InformacionDAO();
        return info.modificarHistoria(historia);
            
    }
    
    public String mostrarMision() throws Exception{
        InformacionDAO dao = new InformacionDAO();
        return dao.mostrarMision();
    }
    
    public String mostrarVision() throws Exception{
        InformacionDAO dao = new InformacionDAO();
        return dao.mostrarVision();
    }
    
    public String mostrarHistoria() throws Exception{
        InformacionDAO dao = new InformacionDAO();
        return dao.mostrarHistoria();
    }
}
