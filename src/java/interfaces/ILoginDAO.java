/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

/**
 *
 * @author Javier
 */
public interface ILoginDAO {
    
    public boolean validarUsuario(String user, String password, String tipo_usuario) throws Exception;
    
}
