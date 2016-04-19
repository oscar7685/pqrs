/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

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
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class MedioIngreso implements Action {
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("Web", pqrsFacade.findByList("medioIngreso", "Web"));
        sesion.setAttribute("Correo", pqrsFacade.findByList("medioIngreso", "Correo"));
        sesion.setAttribute("Telefono", pqrsFacade.findByList("medioIngreso", "Telefono"));
        sesion.setAttribute("Manual", pqrsFacade.findByList("medioIngreso", "Manual"));
        sesion.setAttribute("Verbal", pqrsFacade.findByList("medioIngreso", "Verbal"));
        sesion.setAttribute("Fax", pqrsFacade.findByList("medioIngreso", "Fax"));
        sesion.setAttribute("total", pqrsFacade.findAll());
        return "informes/medioIngreso.jsp";



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
