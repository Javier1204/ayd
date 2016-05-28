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
public class ReservaRecursoDTO {

    private String nombreRecurso;
    private String servicios;
    private String id_cliente;
    private String fecha_inicio;
    private String fecha_final;
    private String id;

    public ReservaRecursoDTO(String nombreRecurso, String servicios, String id_cliente, String fecha_inicio, String fecha_final, String id) {
        this.nombreRecurso = nombreRecurso;
        this.servicios = servicios;
        this.id_cliente = id_cliente;
        this.fecha_inicio = fecha_inicio;
        this.fecha_final = fecha_final;
        this.id = id;
    }
    public ReservaRecursoDTO(String nombreRecurso, String servicios, String id_cliente, String fecha_inicio, String fecha_final) {
        this.nombreRecurso = nombreRecurso;
        this.servicios = servicios;
        this.id_cliente = id_cliente;
        this.fecha_inicio = fecha_inicio;
        this.fecha_final = fecha_final;
    }

    public String getNombreRecurso() {
        return nombreRecurso;
    }

    public void setNombreRecurso(String nombreRecurso) {
        this.nombreRecurso = nombreRecurso;
    }

    public String getServicios() {
        return servicios;
    }

    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    
}
