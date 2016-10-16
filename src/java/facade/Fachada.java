/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import dao.LoginDAO;
import dto.ClienteDTO;
import dto.ComentarioDTO;
import dto.EmpleadoDTO;
import dto.FacturaDTO;
import dto.HabitacionDTO;
import dto.HospedajeDTO;
import dto.ReservaDTO;
import dto.ReservaRecursoDTO;
import java.sql.Date;
import java.util.ArrayList;
import negocio.cliente.ControlCliente;
import negocio.empleado.controlEmpleado;
import negocio.factura.ControlFactura;
import negocio.hospedajes.ControlHospedaje;
import negocio.recurso.ControlRecurso;
import negocio.reserva.ControlReserva;

/**
 *
 * @author Javier
 */
public class Fachada {

    public boolean iniciarSesion(String user, String password, String tipo_usuario) throws Exception {
        LoginDAO dao = new LoginDAO();
        return dao.validarUsuario(user, password, tipo_usuario);
    }

    public boolean registrarHospedaje(String id_habitacion, String cantPersonas, String id_cliente, String fecha_salida) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.registrarHospedaje(id_habitacion, cantPersonas, id_cliente, fecha_salida);
    }
    
    public boolean registrarHabitacion(String id, String tipo, String descripcion, String url, double tarifa) throws Exception{
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.registrarHabitacion(id, tipo, descripcion, url, tarifa);
    }

    public ArrayList<String> obtenerHabitacionesDisponibles(int cantPersonas, String fecha_salida) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.obtenerHabitacionesDisponibles(cantPersonas, fecha_salida);
    }

    public ArrayList<HospedajeDTO> obtenerHospedajes() throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.obtenerHospedajes();
    }

    public ArrayList<HospedajeDTO> obtenerHospedajesActivos() throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.obtenerHospedajesActivos();
    }

    public HospedajeDTO consultarHospedaje(String id_cliente, String f_salida, String f_entrada) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.consultarHospedaje(id_cliente, f_salida, f_entrada);
    }

    public HospedajeDTO consultarHospedajeActivo(String id_cliente, String id_habitacion) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.consultarHospedajeActivo(id_cliente, id_habitacion);
    }

    public boolean modificarHospedaje(String id_habitacion, String cantPersonas, String id_cliente, String fecha_salida, String habAnt, String id) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.modificarHospedaje(id_habitacion, cantPersonas, id_cliente, fecha_salida, habAnt, id);
    }
    
    public boolean finalziarHospedaje(String id_cliente, String idHab,String fecha_salida, String fecha_entrada) throws Exception{
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.finalizarHospedaje(id_cliente, idHab, fecha_salida, fecha_entrada);
    }

    public HabitacionDTO consultarHabitacion(String id) throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.consultarHabitacion(id);
    }

    public ArrayList<HabitacionDTO> obtenerHabitaciones() throws Exception {
        ControlHospedaje hospedaje = new ControlHospedaje();
        return hospedaje.obtenerHabitaciones();
    }

    public boolean validarCliente(String id) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.validarCliente(id);
    }

    public boolean registrarCliente(String id_cliente, String nombre_cliente, String apellido, String telefono, String email, String procedencia) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.registrarCliente(id_cliente, nombre_cliente, apellido, telefono, email, procedencia);
    }

    public ArrayList<ClienteDTO> obtenerClientes() throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.obtenerClientes();
    }

    public ClienteDTO consultarCliente(String id) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.consultarCliente(id);
    }

    public boolean modificarCliente(String id_cliente, String nombre_cliente, String apellido, String telefono, String email, String procedencia) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.modificarCliente(id_cliente, nombre_cliente, apellido, telefono, email, procedencia);
    }

    public boolean eliminarCliente(String id_cliente) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.eliminarCliente(id_cliente);
    }

    public boolean registrarComentario(String nick, String comentario) throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.registrarComentario(nick, comentario);
    }

    public ArrayList<ComentarioDTO> obtenerComentarios() throws Exception {
        ControlCliente cliente = new ControlCliente();
        return cliente.obtenerComentarios();
    }

    public ArrayList<String> consultarHabitacionesDispReserva(int cant, String fecha_salida, String fecha_entrada) throws Exception {
        ControlReserva reserva = new ControlReserva();
        return reserva.consultarHabitacionesDisponiblesReserva(cant, fecha_salida, fecha_entrada);
    }

    public boolean registrarReserva(String id_habitacion, String id_cliente, int cantidad, String fecha_inicio, String fecha_salida, String nombre_cliente, String telefono, String email, String apellido) throws Exception {
        ControlReserva reserva = new ControlReserva();
        return reserva.registrarReserva(id_habitacion, id_cliente, cantidad, fecha_inicio, fecha_salida, nombre_cliente, telefono, email, apellido);
    }

    public ArrayList<ReservaDTO> obtenerReservas() throws Exception {
        ControlReserva reserva = new ControlReserva();
        return reserva.obtenerReservas();
    }

    public ReservaDTO consultarReserva(String id_cliente) throws Exception {
        ControlReserva reserva = new ControlReserva();
        return reserva.consultarReserva(id_cliente);
    }

    public boolean cancelarReserva(String id_reserva) throws Exception {
        ControlReserva reserva = new ControlReserva();
        return reserva.cancelarReserva(id_reserva);
    }

    public boolean convertirReservaHospedaje(String id_habitacion, String id_cliente, int cantidad, String fecha_inicio, String fecha_salida, String nombre_cliente, String telefono, String email, String apellido, String id_reserva) throws Exception {
        ControlReserva reserva = new ControlReserva();
        ControlHospedaje hospedaje = new ControlHospedaje();
        ControlCliente cliente = new ControlCliente();
        boolean exito = false;
        if (cliente.registrarCliente(id_cliente, nombre_cliente, apellido, telefono, email, "Colombia")) {
            if (hospedaje.registrarHospedaje(id_habitacion, cantidad + "", id_cliente, fecha_salida)) {
                if(reserva.cancelarReserva(id_reserva)){
                    exito = true;
                }
            }
        }else if(cliente.validarCliente(id_cliente)){
            if (hospedaje.registrarHospedaje(id_habitacion, cantidad + "", id_cliente, fecha_salida)) {
                if(reserva.cancelarReserva(id_reserva)){
                    exito = true;
                }
            }
        }
        return exito;
    }

    public ArrayList<String> obtenerRecursosDisponibles(String fecha_entrada, String fecha_salida) throws Exception {
        ControlRecurso recurso = new ControlRecurso();
        return recurso.obtenerRecursosDisponibles(fecha_entrada, fecha_salida);
    }

    public boolean registrarReservaRecurso(String nombreRecurso, String servicios, String idCliente, String fechaEntrada, String fechaSalida) throws Exception {
        ControlRecurso reservaR = new ControlRecurso();
        return reservaR.registrarReservaRecurso(nombreRecurso, servicios, idCliente, fechaEntrada, fechaSalida);
    }

    public ArrayList<ReservaRecursoDTO> obtenerReservasRecurso() throws Exception {
        ControlRecurso reservaR = new ControlRecurso();
        return reservaR.obtenerReservaRecurso();
    }

    public ReservaRecursoDTO consultarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_inicio, String fecha_fin) throws Exception {
        ControlRecurso reservaRecurso = new ControlRecurso();
        return reservaRecurso.consultarReservaRecurso(id_cliente, nombre_recurso, fecha_inicio, fecha_fin);
    }

    public boolean modificarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_entrada, String fecha_salida, String servicios, String nombreRecursoP, String fechaInicioP, String fechaFinP) throws Exception {
        ControlRecurso reservaRecurso = new ControlRecurso();
        return reservaRecurso.modificarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida, servicios, nombreRecursoP, fechaInicioP, fechaFinP);

    }

    public boolean cancelarReservaRecurso(String id_cliente, String nombre_recurso, String fecha_entrada, String fecha_salida, String servicios) throws Exception {
        ControlRecurso reservaRecurso = new ControlRecurso();
        return reservaRecurso.cancelarReservaRecurso(id_cliente, nombre_recurso, fecha_entrada, fecha_salida, servicios);
    }

    public String obtenerTarifaRecurso(String nombre_recurso) throws Exception {
        ControlRecurso tarifaRecurso = new ControlRecurso();
        return tarifaRecurso.obtenerTarifaRecurso(nombre_recurso);
    }
    
    public FacturaDTO registrarFacturaHospedaje(String id_cliente, String id_servicio) throws Exception {
        ControlFactura control = new ControlFactura();
        return control.registrarFacturaHospedaje(id_cliente, id_servicio);
    }

    public FacturaDTO registrarFacturaRecurso(String id_cliente, String id_servicio) throws Exception {
        ControlFactura control = new ControlFactura();
        return control.registrarFacturaRecurso(id_cliente, id_servicio);
    }

    public ArrayList<FacturaDTO> consultarFacturaHospedaje(String id_hospedaje) throws Exception {
        ControlFactura control = new ControlFactura();
        return control.consultarFacturaHospedaje(id_hospedaje);
    }

    public ArrayList<FacturaDTO> consultarFacturaResRecurso(String id_res_recurso) throws Exception {
        ControlFactura control = new ControlFactura();
        return control.consultarFacturaResRecurso(id_res_recurso);
    }

    public ArrayList<FacturaDTO> consultarFacturaCliente(String id_cliente) throws Exception {
        ControlFactura control = new ControlFactura();
        return control.consultarFacturaCliente(id_cliente);
    }

    public ArrayList<FacturaDTO> mostrarFacturas() throws Exception {
        ControlFactura control = new ControlFactura();
        return control.mostrarFacturas();
    }
    
    public FacturaDTO actualizarFacturaRecurso(FacturaDTO dto) throws Exception{
        ControlFactura control = new ControlFactura();
        return control.actualizarFacturaRecurso(dto);
    }
    
    public boolean registrarEmpleado(String nombres, String apellidos, String cc, String cargo, String lugar_nacimiento, String fecha_nacimiento, String nivel_estudio, String direccion, String celular, String fijo, String email, String genero, int anio_experiencia) throws Exception{
        controlEmpleado control = new controlEmpleado();
        return control.registrarEmpleado(nombres, apellidos, cc, cargo, lugar_nacimiento, fecha_nacimiento, nivel_estudio, direccion,  celular,  fijo,  email,  genero,  anio_experiencia);
    }

//    public void generarPdf(String id_servicio, String tipo_servicio) throws Exception {
//        ControlFactura control = new ControlFactura();
//        PDF pdf = new PDF();
//        FacturaDTO factura = null;
//        if (tipo_servicio.equals("Hospedaje")) {
//            factura = control.consultarFacturaHospedaje(id_servicio);
//        } else if (tipo_servicio.equals("Recurso")) {
//            factura = control.consultarFacturaResRecurso(id_servicio);
//        }
//        pdf.crearPDF(factura);
//    }

}


