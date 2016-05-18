/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Javier
 */
public class FacturaDTO {
 
    private String id_activo;
    private Date fecha;
    private String id_cliente;
    private double precio;
    private Date fecha_factura;

    public FacturaDTO(String id_activo, Date fecha, String id_cliente, double precio, Date fecha_factura) {
        this.id_activo = id_activo;
        this.fecha = fecha;
        this.id_cliente = id_cliente;
        this.precio = precio;
        this.fecha_factura = fecha_factura;
    }

    public String getId_activo() {
        return id_activo;
    }

    public void setId_activo(String id_activo) {
        this.id_activo = id_activo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }
    
    
}
