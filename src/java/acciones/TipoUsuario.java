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
public class TipoUsuario implements Action {
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("Aspirante", pqrsFacade.findByList("reclamanteIdreclamante.tipo", "ASPIRANTE"));
        sesion.setAttribute("Docente", pqrsFacade.findByList("reclamanteIdreclamante.tipo", "PROFESOR"));
        sesion.setAttribute("Egresado", pqrsFacade.findByList("reclamanteIdreclamante.tipo", "EGRESADO"));
        sesion.setAttribute("Estudiante", pqrsFacade.findByList("reclamanteIdreclamante.tipo", "ESTUDIANTE"));
        sesion.setAttribute("Particular", pqrsFacade.findByList("reclamanteIdreclamante.tipo", "PARTICULAR"));
        sesion.setAttribute("total", pqrsFacade.findAll());
        return "informes/tipoUsuario.jsp";



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
