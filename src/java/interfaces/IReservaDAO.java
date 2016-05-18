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
    
    public boolean registrarReserva(ReservaDTO dto);
    public ReservaDTO consultarReserva(String id);
    public ArrayList<ReservaDTO> obtenerReservas();
    public boolean cancelarReserva(String id);
    public ArrayList<ReservaDTO> obtenerReservasPendientes();
    public boolean pagarReserva(String id);
    
}
