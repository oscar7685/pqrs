/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Asignacion;
import entidades.Pqrs;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import sesionbeans.DiasNoHabilesFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class ListarTodasPQRS implements Action {

    DiasNoHabilesFacade diasNoHabilesFacade = lookupDiasNoHabilesFacadeBean();

    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();
        ResponsableArea r = (ResponsableArea) session.getAttribute("responsableArea");
        if (r.getAreaIdarea().getIdarea() == 1000) {
            List<Pqrs> listaPqrs = pqrsFacade.findAll();
            int[] diasHabilesRestantes = new int[listaPqrs.size()];

            Calendar fechaInicial = Calendar.getInstance();
            Calendar fechaActual = Calendar.getInstance();
            int i = 0;
            for (Pqrs pqrsAux : listaPqrs) {
                int diffDays = 0;
                fechaInicial.setTime(pqrsAux.getFechaCreacion());
                fechaActual.setTime(new Date());
                while (fechaInicial.before(fechaActual)) {
                    //si el dia de la semana de la fecha minima es diferente de sabado o domingo
                    if (fechaInicial.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY
                            && fechaInicial.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY
                            && diasNoHabilesFacade.findWhereDate(fechaInicial.getTime()) == null) {
                        //se aumentan los dias de diferencia entre min y max
                        diffDays++;
                    }
                    //se suma 1 dia para hacer la validacion del siguiente dia.
                    fechaInicial.add(Calendar.DATE, 1);
                }
                diasHabilesRestantes[i] = diffDays;
                i++;
            }

            session.setAttribute("diasHabilesRestantes", diasHabilesRestantes);
            session.setAttribute("pqrsTotales", listaPqrs);
        } else {
            List<Asignacion> asignaciones = asignacionFacade.findByList("asignadoA", r);
            session.setAttribute("asignaciones", asignaciones);
        }

        return "pqrs/listarTodas.jsp";

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

    private DiasNoHabilesFacade lookupDiasNoHabilesFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DiasNoHabilesFacade) c.lookup("java:global/pqrs/DiasNoHabilesFacade!sesionbeans.DiasNoHabilesFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
