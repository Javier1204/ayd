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
    
    public FacturaDTO generarFacturaHospedaje(String id_hospedaje);
    public void generarPdf(FacturaDTO dto);
    public FacturaDTO generarFacturaRecurso(String id_recurso, String id_cliente, Date fecha_inicio);
    public boolean registrarFactura(FacturaDTO dto);
    public FacturaDTO consultarFacturaHospedaje(String id_hospedaje, String fecha, String id_cliente);
    public FacturaDTO consultarFacturaRecurso(String id_recurso, String fecha, String id_cliente);
    public ArrayList<FacturaDTO> obtenerFacturas();
    
}
