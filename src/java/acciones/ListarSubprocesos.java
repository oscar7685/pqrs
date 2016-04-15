/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Reclamante;
import entidades.ResponsableArea;
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
import sesionbeans.AreaFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ProcesoFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;
import sesionbeans.SubprocesoFacade;

/**
 *
 * @author Ususario
 */
public class ListarSubprocesos implements Action {
    SubprocesoFacade subprocesoFacade = lookupSubprocesoFacadeBean();
    

   
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();

        session.setAttribute("subprocesos", subprocesoFacade.findAll());
        return "subprocesos/listar.jsp";



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
