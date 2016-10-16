/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.InformacionDTO;

/**
 *
 * @author FARID SANTIAGO
 */
public interface IInformacionDAO {
    
   
    public boolean modificarMision(InformacionDTO dto) throws Exception;
    public boolean modificarVision(InformacionDTO dto) throws Exception;
    public boolean modificarHistoria(InformacionDTO dto) throws Exception;
}
