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
public class ReservaDTO {
    private String id_habitacion;
    private String id_cliente;
    private int cantPersonas;
    private String fecha_inicio;
    private String fecha_salida;
    private String nombreCliente;
    private String telefono;
    private String email;
    private String apellido;
    private String procedencia;

    public ReservaDTO(String id_habitacion, String id_cliente, int cantPersonas, String fecha_inicio, String fecha_salida, String nombreCliente, String telefono, String email, String apellido, String procedencia) {
        this.id_habitacion = id_habitacion;
        this.id_cliente = id_cliente;
        this.cantPersonas = cantPersonas;
        this.fecha_inicio = fecha_inicio;
        this.fecha_salida = fecha_salida;
        this.nombreCliente = nombreCliente;
        this.telefono = telefono;
        this.email = email;
        this.apellido = apellido;
        this.procedencia = procedencia;
    }

    public String getId_habitacion() {
        return id_habitacion;
    }

    public void setId_habitacion(String id_habitacion) {
        this.id_habitacion = id_habitacion;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(String fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }
    
}
