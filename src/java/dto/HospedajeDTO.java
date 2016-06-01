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
public class HospedajeDTO {
    
    private String id_habitacion;
    private int cantPersonas;
    private String id_cliente;
    private String fecha_salida;
    private String fecha_entrada;
    private int id;

    public HospedajeDTO(String id_habitacion, int cantPersonas, String id_cliente,String fecha_salida, String fecha_entrada) {
        this.id_habitacion = id_habitacion;
        this.cantPersonas = cantPersonas;
        this.id_cliente = id_cliente;
        this.fecha_entrada = fecha_entrada;
        this.fecha_salida = fecha_salida;
    }

    public HospedajeDTO(String id_habitacion, int cantPersonas, String id_cliente, String fecha_salida, String fecha_entrada, int id) {
        this.id_habitacion = id_habitacion;
        this.cantPersonas = cantPersonas;
        this.id_cliente = id_cliente;
        this.fecha_salida = fecha_salida;
        this.fecha_entrada = fecha_entrada;
        this.id = id;
    }
    
    

    public String getId_habitacion() {
        return id_habitacion;
    }

    public void setId_habitacion(String id_habitacion) {
        this.id_habitacion = id_habitacion;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFecha_entrada() {
        return fecha_entrada;
    }

    public void setFecha_entrada(String fecha_entrada) {
        this.fecha_entrada = fecha_entrada;
    }

    public String getFecha_salida() {
        return fecha_salida;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFecha_salida(String fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    
    
}
