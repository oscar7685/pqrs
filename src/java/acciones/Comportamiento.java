/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Pqrs;
import interfaz.Action;
import java.io.IOException;
import java.util.Calendar;
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
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class Comportamiento implements Action {

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        List<Pqrs> peticiones = pqrsFacade.findByList("tipo", "Peticion");
        List<Pqrs> Quejas = pqrsFacade.findByList("tipo", "Queja");
        List<Pqrs> Reclamos = pqrsFacade.findByList("tipo", "Reclamo");
        List<Pqrs> Sugerencias = pqrsFacade.findByList("tipo", "Sugerencia");

        int[] mesesP = new int[6];
        int[] mesesQ = new int[6];
        int[] mesesR = new int[6];
        int[] mesesS = new int[6];

        for (Pqrs p : peticiones) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesP[month]++;
        }
        for (Pqrs p : Quejas) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesQ[month]++;
        }
        for (Pqrs p : Reclamos) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesR[month]++;
        }
        for (Pqrs p : Sugerencias) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesS[month]++;
        }

        sesion.setAttribute("Peticion", mesesP);
        sesion.setAttribute("Queja", mesesQ);
        sesion.setAttribute("Reclamo", mesesR);
        sesion.setAttribute("Sugerencia", mesesS);

        sesion.setAttribute("total", pqrsFacade.findAll());
        return "informes/comportamiento.jsp";

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

}
