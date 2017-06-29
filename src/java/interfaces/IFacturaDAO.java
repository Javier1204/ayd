/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import dto.FacturaDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public interface IFacturaDAO {
    
    public FacturaDTO generarFacturaHospedaje(FacturaDTO dto)throws Exception;
    public FacturaDTO generarFacturaRecurso(FacturaDTO dto)throws Exception;
    public FacturaDTO modificarFacturaRecurso(FacturaDTO dto)throws Exception;
    public ArrayList<FacturaDTO> consultarFacturaHospedaje(String id_hospedaje)throws Exception;
    public ArrayList<FacturaDTO> consultarFacturaResRecurso(String id_recurso)throws Exception;
    public ArrayList<FacturaDTO> consultarFacturaCliente(String id_cliente)throws Exception;
    public ArrayList<FacturaDTO> mostrarFacturas()throws Exception;

    
    
}
