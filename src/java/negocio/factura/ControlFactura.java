/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.factura;

import dao.FacturaDAO;
import dto.FacturaDTO;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Javier
 */
public class ControlFactura {

    public FacturaDTO registrarFacturaHospedaje(String id_cliente, String id_servicio) throws Exception {
        FacturaDAO factura = new FacturaDAO();
        Calendar c1 = Calendar.getInstance();
        String fecha = c1.get(Calendar.YEAR) + "-" + (c1.get(Calendar.MONTH) + 1) + "-" + c1.get(Calendar.DAY_OF_MONTH);
        FacturaDTO dto = new FacturaDTO(id_cliente, id_servicio, "Hospedaje", fecha);
        return factura.generarFacturaHospedaje(dto);
    }

    public FacturaDTO registrarFacturaRecurso(String id_cliente, String id_servicio) throws Exception {
        FacturaDAO factura = new FacturaDAO();
        Calendar c1 = Calendar.getInstance();
        String fecha = c1.get(Calendar.YEAR) + "-" + (c1.get(Calendar.MONTH) + 1) + "-" + c1.get(Calendar.DAY_OF_MONTH);
        FacturaDTO dto = new FacturaDTO(id_cliente, id_servicio, "Recurso", fecha);
        return factura.generarFacturaRecurso(dto);
    }

    public ArrayList<FacturaDTO> consultarFacturaHospedaje(String id_hospedaje) throws Exception {
        FacturaDAO factura = new FacturaDAO();
        return factura.consultarFacturaHospedaje(id_hospedaje);
    }

    public ArrayList<FacturaDTO> consultarFacturaResRecurso(String id_res_recurso) throws Exception {
        FacturaDAO factura = new FacturaDAO();
        return factura.consultarFacturaResRecurso(id_res_recurso);
    }

    public ArrayList<FacturaDTO> consultarFacturaCliente(String id_cliente) throws Exception {
        FacturaDAO factura = new FacturaDAO();
        return factura.consultarFacturaCliente(id_cliente);
    }

    public ArrayList<FacturaDTO> mostrarFacturas() throws Exception {
        FacturaDAO factura = new FacturaDAO();
        return factura.mostrarFacturas();
    }
}
