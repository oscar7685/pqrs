/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Proceso;
import entidades.Subproceso;
import interfaz.Action;
import java.io.IOException;
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
public class CrearSubproceso2 implements Action {
    SubprocesoFacade subprocesoFacade = lookupSubprocesoFacadeBean();

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String proceso = request.getParameter("proceso");
        Proceso pro = procesoFacade.find(Integer.parseInt(proceso));
        
        String subproceso = request.getParameter("subproceso");
        Subproceso s = new Subproceso();
        s.setSubproceso(subproceso);
        s.setProcesoIdproceso(pro);
        subprocesoFacade.create(s);
        return "subprocesos/listar.jsp";
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
