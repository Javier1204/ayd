/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author FARID SANTIAGO
 */
public class EmpleadoDTO {
    
    private String nombres, apellidos, cc, cargo, lugar_nacimiento, fecha_nacimiento, nivel_estudio, direccion, celular, fijo, email, genero;
    private int anio_experiencia;

    public EmpleadoDTO(String nombres, String apellidos, String cc, String cargo, String lugar_nacimiento, String fecha_nacimiento, String nivel_estudio, String direccion, String celular, String fijo, String email, String genero, int anio_experiencia) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.cc = cc;
        this.cargo = cargo;
        this.lugar_nacimiento = lugar_nacimiento;
        this.fecha_nacimiento = fecha_nacimiento;
        this.nivel_estudio = nivel_estudio;
        this.direccion = direccion;
        this.celular = celular;
        this.fijo = fijo;
        this.email = email;
        this.genero = genero;
        this.anio_experiencia = anio_experiencia;
    }

    public EmpleadoDTO() {
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getLugar_nacimiento() {
        return lugar_nacimiento;
    }

    public void setLugar_nacimiento(String lugar_nacimiento) {
        this.lugar_nacimiento = lugar_nacimiento;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getNivel_estudio() {
        return nivel_estudio;
    }

    public void setNivel_estudio(String nivel_estudio) {
        this.nivel_estudio = nivel_estudio;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getFijo() {
        return fijo;
    }

    public void setFijo(String fijo) {
        this.fijo = fijo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getAnio_experiencia() {
        return anio_experiencia;
    }

    public void setAnio_experiencia(int anio_experiencia) {
        this.anio_experiencia = anio_experiencia;
    }
    
    
}
