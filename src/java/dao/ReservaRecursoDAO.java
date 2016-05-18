/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ReservaRecursoDTO;
import interfaces.IReservaRecurso;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Javier
 */
public class ReservaRecursoDAO implements IReservaRecurso{

    @Override
    public boolean registrarReservaRecurso(ReservaRecursoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ReservaRecursoDTO consultarReservaRecurso(String nombre_recurso, String id_cliente, Date fecha_inicio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ReservaRecursoDTO> obtenerReservasRecurso() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean cancelarReservaRecurso(String nombre_recurso, String id_cliente, Date fecha_inicio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ReservaRecursoDTO> obtenerReservasPendientes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
