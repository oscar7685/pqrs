/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Proceso;
import entidades.Subproceso;
import interfaz.Action;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import sesionbeans.ProcesoFacade;
import sesionbeans.SubprocesoFacade;

/**
 *
 * @author Ususario
 */
public class VerSubprocesos implements Action {

    SubprocesoFacade subprocesoFacade = lookupSubprocesoFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String proceso = request.getParameter("proceso");
        Proceso proc = procesoFacade.find(Integer.parseInt(proceso));
        List<Subproceso> subs = subprocesoFacade.findByList("procesoIdproceso", proc);
        sesion.setAttribute("subprocesos", subs);
        return "subprocesos/verSubprocesos.jsp";

    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/pqrs/ProcesoFacade!sesionbeans.ProcesoFacade");
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
