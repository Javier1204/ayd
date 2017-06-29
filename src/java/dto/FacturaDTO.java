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
 
    private int num_factura;
    private String id_cliente;
    private String id_servicio;
    private String tipo_servicio;
    private int precio;
    private String fecha_factura;   
    private String descripcion;

    public FacturaDTO(String id_cliente, String id_servicio, String tipo_servicio, String fecha_factura) {
        this.id_cliente = id_cliente;
        this.id_servicio = id_servicio;
        this.tipo_servicio = tipo_servicio;
        this.fecha_factura = fecha_factura;
    }

    public FacturaDTO(int num_factura, String id_cliente, String id_servicio, String tipo_servicio, int precio, String fecha_factura, String descripcion) {
        this.num_factura = num_factura;
        this.id_cliente = id_cliente;
        this.id_servicio = id_servicio;
        this.tipo_servicio = tipo_servicio;
        this.precio = precio;
        this.fecha_factura = fecha_factura;
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public int getNum_factura() {
        return num_factura;
    }

    public void setNum_factura(int num_factura) {
        this.num_factura = num_factura;
    }

    public String getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(String id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getTipo_servicio() {
        return tipo_servicio;
    }

    public void setTipo_servicio(String tipo_servicio) {
        this.tipo_servicio = tipo_servicio;
    }
   
    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }
    
    
}
