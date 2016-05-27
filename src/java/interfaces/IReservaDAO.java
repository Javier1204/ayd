/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.ReservaDTO;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IReservaDAO {
    
    public boolean registrarReserva(ReservaDTO dto) throws Exception;
    public ReservaDTO consultarReserva(int id) throws Exception;
    public ArrayList<ReservaDTO> obtenerReservas() throws Exception;
    public boolean cancelarReserva(int id) throws Exception;
    public ArrayList<ReservaDTO> obtenerReservasPendientes() throws Exception;
    public boolean pagarReserva(int id) throws Exception;
    
}
