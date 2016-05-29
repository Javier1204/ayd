/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.ComentarioDTO;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IComentarioDAO {
    
    public boolean registrarComentario(ComentarioDTO comentario) throws Exception;
    public ArrayList<ComentarioDTO> obtenerComentarios() throws Exception;
    
}
