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
import entidades.Respuesta;
import entidades.Subproceso;
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
import sesionbeans.RespuestaFacade;
import sesionbeans.SubprocesoFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class ResponderPQRS2 implements Action {

    SubprocesoFacade subprocesoFacade = lookupSubprocesoFacadeBean();

    RespuestaFacade respuestaFacade = lookupRespuestaFacadeBean();
    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();
    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Pqrs p = (Pqrs) sesion.getAttribute("pqrs");
        String subproceso = request.getParameter("subproceso");
        Subproceso sub = subprocesoFacade.find(Integer.parseInt(subproceso));
        ResponsableArea respon = (ResponsableArea) sesion.getAttribute("responsableArea");

        String respuesta = request.getParameter("respuesta");

        Respuesta res = new Respuesta();
        res.setPqrsIdpqrs(p);
        res.setResponsableAreaIdresponsableArea(respon);
        res.setRespuesta(respuesta);
        res.setFechaRespuesta(new Date());
        res.setEvaluacion("NP");
        res.setSubprocesoIdsubproceso(sub);
        respuestaFacade.create(res);
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Respuesta raux = respuestaFacade.findUltimo("idrespuesta");
        List<Respuesta> lres = p.getRespuestaList();
        lres.add(raux);
        p.setRespuestaList(lres);
        p.setEstadoSolicitud("Respuesta enviada al usuario");
        pqrsFacade.edit(p);

        String msg = "NOTIFICACIÓN DE NOVEDAD PQRS - " + p.getCodigo() + "\n"
                + "\n"
                + "Estimado Usuario,\n"
                + "\n"
                + "Le informamos que existe una novedad en su PQRS, disponible en la plataforma virtual.\n"
                + "Lo invitamos ingresar.\n"
                + "_____________________________________________________________________________________________\n"
                + "\n"
                + "Agradecemos la utilización del procedimiento de peticiones, quejas, reclamos y sugerencias, lo que sin duda contribuye al mejoramiento continuo de nuestra Institución.\n"
                + "Cordialmente,\n"
                + "\n"
                + "SECRETARÍA GENERAL\n"
                + "UNIVERSIDAD DE CARTAGENA\n"
                + "" + formatoDelTexto.format(new Date());

        JavaMail jm = new JavaMail();
        jm.setAsunto("Registro de novedades en PQRS - " + p.getCodigo());
        jm.setMensage(msg);
        jm.setTo(p.getReclamanteIdreclamante().getEmail());
        jm.setCc(respon.getEmail() + ",micuenta40@gmail.com");
        jm.sendMail();
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

    private RespuestaFacade lookupRespuestaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RespuestaFacade) c.lookup("java:global/pqrs/RespuestaFacade!sesionbeans.RespuestaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private SubprocesoFacade lookupSubprocesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (SubprocesoFacade) c.lookup("java:global/pqrs/SubprocesoFacade!sesionbeans.SubprocesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
