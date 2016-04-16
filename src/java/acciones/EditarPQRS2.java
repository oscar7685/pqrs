/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.Asignacion;
import entidades.Pqrs;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import sesionbeans.AreaFacade;
import sesionbeans.AsignacionFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ResponsableAreaFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class EditarPQRS2 implements Action {

    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();
    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Pqrs p = (Pqrs) sesion.getAttribute("pqrs");

        ResponsableArea asignador = (ResponsableArea) sesion.getAttribute("responsableArea");

        String dependencia = request.getParameter("dependencia");
        String funcionario = request.getParameter("funcionario");
        String fechaCreacion = request.getParameter("fechaCreacion");

        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaI = null;
        try {

            fechaI = formatoDelTexto.parse(fechaCreacion);

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        p.setFechaCreacion(fechaI);
        pqrsFacade.edit(p);

        ResponsableArea ra = responsableAreaFacade.find(Integer.parseInt(funcionario));

        if (p.getAsignacionList().size() > 0) {

            if (p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getIdresponsableArea() != ra.getIdresponsableArea()) {

                Area a = areaFacade.find(Integer.parseInt(dependencia));

                Asignacion as = new Asignacion();
                as.setAsignadoA(ra);
                as.setPqrsIdpqrs(p);
                as.setAsignadoPor(asignador);
                as.setFechaAsignacion(new Date());
                as.setRequerimiento(new Integer("0"));
                asignacionFacade.create(as);

                Pqrs aux = pqrsFacade.find(p.getIdpqrs());
                List<Asignacion> listAsig = aux.getAsignacionList();
                listAsig.add(as);
                aux.setAsignacionList(listAsig);
                pqrsFacade.edit(aux);
                String msg = "NOTIFICACIÓN DE ASIGNACIÓN DE  PQRS - " + p.getCodigo() + "\n"
                        + "\n"
                        + "PARA:" + p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getIdresponsableArea() + " - " + p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + "\n"
                        + "DE: SECRETARIA GENERAL\n"
                        + "\n"
                        + "Se ha radicado la PQRS - " + p.getCodigo() + ", presentada por " + p.getReclamanteIdreclamante().getNombre() + " " + p.getReclamanteIdreclamante().getApellido()
                        + ", y asignada a " + p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + " como dependencia responsable de dar una respuesta oportuna y pertinente.\n"
                        + "\n"
                        + "Agradecemos a " + p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + ", ingresar a la plataforma virtual para consultar dicha solicitud, y adelantar las acciones necesarias para dar respuesta dentro de los diez (10) días siguientes al recibo de este correo.\n"
                        + "_____________________________________________________________________________________________\n"
                        + "INFORMACIÓN DE LA PQRS ASIGNADA\n"
                        + "\n"
                        + "USUARIO: " + p.getReclamanteIdreclamante().getIdreclamante() + " - " + p.getReclamanteIdreclamante().getNombre() + " " + p.getReclamanteIdreclamante().getApellido() + "\n"
                        + "EMAIL: " + p.getReclamanteIdreclamante().getEmail() + "\n"
                        + "CONTACTO: " + p.getReclamanteIdreclamante().getCelular() + "\n"
                        + "TIPO: " + p.getTipo() + "\n"
                        + "MEDIO DE INGRESO: " + p.getMedioIngreso() + "\n"
                        + "\n"
                        + "Información de PQRS\n"
                        + p.getReclamanteIdreclamante().getNombre() + " " + p.getReclamanteIdreclamante().getApellido() + "<" + p.getReclamanteIdreclamante().getEmail() + "> " + formatoDelTexto.format(new Date()) + "\n"
                        + "Responder a: " + p.getReclamanteIdreclamante().getNombre() + " " + p.getReclamanteIdreclamante().getApellido() + " <" + p.getReclamanteIdreclamante().getEmail() + ">\n"
                        + "Para: pqrs@unicartagena.edu.co\n"
                        + "[Nombre y Apellidos Completos] " + p.getReclamanteIdreclamante().getNombre() + " " + p.getReclamanteIdreclamante().getApellido() + "\n"
                        + "[Correo Electrónico] " + p.getReclamanteIdreclamante().getEmail() + "\n"
                        + "[No. de Identificación] " + p.getReclamanteIdreclamante().getIdreclamante() + "\n"
                        + "[Teléfono / Celular] " + p.getReclamanteIdreclamante().getCelular() + "\n"
                        + "[Es usted] " + p.getReclamanteIdreclamante().getTipo() + "\n"
                        + "[Asunto] " + p.getTipo() + "\n"
                        + "[Dependencia a la que dirige la PQRS] " + p.getAreaIdarea().getNombre() + "\n"
                        + "[Comentario] " + p.getDescripcion() + "\n"
                        + "\n"
                        + "Agradecemos la utilización del procedimiento de peticiones, quejas, reclamos y sugerencias, lo que sin duda contribuye al mejoramiento continuo de nuestra Institución.\n"
                        + "Cordialmente,\n"
                        + "\n"
                        + "SECRETARÍA GENERAL\n"
                        + "UNIVERSIDAD DE CARTAGENA\n"
                        + "" + formatoDelTexto.format(new Date());

                JavaMail jm = new JavaMail();
                jm.setAsunto("Notificación de asignación de PQRS - " + p.getCodigo());
                jm.setMensage(msg);
                jm.setTo("" + p.getAsignacionList().get(p.getAsignacionList().size() - 1).getAsignadoA().getEmail());
                jm.setCc("" + p.getReclamanteIdreclamante().getEmail() + "," + "micuenta40@gmail.com");
                jm.sendMail();

            }
        } else {
            Area a = areaFacade.find(Integer.parseInt(dependencia));

            Asignacion as = new Asignacion();
            as.setAsignadoA(ra);
            as.setPqrsIdpqrs(p);
            as.setAsignadoPor(asignador);
            as.setFechaAsignacion(new Date());
            as.setRequerimiento(new Integer("0"));
            asignacionFacade.create(as);

            Pqrs aux = pqrsFacade.find(p.getIdpqrs());
            List<Asignacion> listAsig2 = new ArrayList<Asignacion>();
            listAsig2.add(as);
            aux.setAsignacionList(listAsig2);
            pqrsFacade.edit(aux);

            String msg = "NOTIFICACIÓN DE ASIGNACIÓN DE  PQRS - " + aux.getCodigo() + "\n"
                    + "\n"
                    + "PARA:" + aux.getAsignacionList().get(aux.getAsignacionList().size() - 1).getAsignadoA().getIdresponsableArea() + " - " + aux.getAsignacionList().get(aux.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + "\n"
                    + "DE: SECRETARIA GENERAL\n"
                    + "\n"
                    + "Se ha radicado la PQRS - " + aux.getCodigo() + ", presentada por " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido()
                    + ", y asignada a " + aux.getAsignacionList().get(aux.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + " como dependencia responsable de dar una respuesta oportuna y pertinente.\n"
                    + "\n"
                    + "Agradecemos a " + aux.getAsignacionList().get(aux.getAsignacionList().size() - 1).getAsignadoA().getAreaIdarea().getNombre() + ", ingresar a la plataforma virtual para consultar dicha solicitud, y adelantar las acciones necesarias para dar respuesta dentro de los diez (10) días siguientes al recibo de este correo.\n"
                    + "_____________________________________________________________________________________________\n"
                    + "INFORMACIÓN DE LA PQRS ASIGNADA\n"
                    + "\n"
                    + "USUARIO: " + aux.getReclamanteIdreclamante().getIdreclamante() + " - " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "\n"
                    + "EMAIL: " + aux.getReclamanteIdreclamante().getEmail() + "\n"
                    + "CONTACTO: " + aux.getReclamanteIdreclamante().getCelular() + "\n"
                    + "TIPO: " + aux.getTipo() + "\n"
                    + "MEDIO DE INGRESO: " + aux.getMedioIngreso() + "\n"
                    + "\n"
                    + "Información de PQRS\n"
                    + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "<" + aux.getReclamanteIdreclamante().getEmail() + "> " + formatoDelTexto.format(new Date()) + "\n"
                    + "Responder a: " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + " <" + aux.getReclamanteIdreclamante().getEmail() + ">\n"
                    + "Para: pqrs@unicartagena.edu.co\n"
                    + "[Nombre y Apellidos Completos] " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "\n"
                    + "[Correo Electrónico] " + aux.getReclamanteIdreclamante().getEmail() + "\n"
                    + "[No. de Identificación] " + aux.getReclamanteIdreclamante().getIdreclamante() + "\n"
                    + "[Teléfono / Celular] " + aux.getReclamanteIdreclamante().getCelular() + "\n"
                    + "[Es usted] " + aux.getReclamanteIdreclamante().getTipo() + "\n"
                    + "[Asunto] " + aux.getTipo() + "\n"
                    + "[Dependencia a la que dirige la PQRS] " + aux.getAreaIdarea().getNombre() + "\n"
                    + "[Comentario] " + aux.getDescripcion() + "\n"
                    + "\n"
                    + "Agradecemos la utilización del procedimiento de peticiones, quejas, reclamos y sugerencias, lo que sin duda contribuye al mejoramiento continuo de nuestra Institución.\n"
                    + "Cordialmente,\n"
                    + "\n"
                    + "SECRETARÍA GENERAL\n"
                    + "UNIVERSIDAD DE CARTAGENA\n"
                    + "" + formatoDelTexto.format(new Date());

            JavaMail jm = new JavaMail();
            jm.setAsunto("Notificación de asignación de PQRS - " + aux.getCodigo());
            jm.setMensage(msg);
            jm.setTo("" + aux.getAsignacionList().get(aux.getAsignacionList().size() - 1).getAsignadoA().getEmail());
            jm.setCc("" + aux.getReclamanteIdreclamante().getEmail() + "," + "micuenta40@gmail.com");
            jm.sendMail();
        }

        return "NA";

    }

    private AreaFacade lookupAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AreaFacade) c.lookup("java:global/pqrs/AreaFacade!sesionbeans.AreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PqrsFacade lookupPqrsFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PqrsFacade) c.lookup("java:global/pqrs/PqrsFacade!sesionbeans.PqrsFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AsignacionFacade lookupAsignacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AsignacionFacade) c.lookup("java:global/pqrs/AsignacionFacade!sesionbeans.AsignacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ResponsableAreaFacade lookupResponsableAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResponsableAreaFacade) c.lookup("java:global/pqrs/ResponsableAreaFacade!sesionbeans.ResponsableAreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
