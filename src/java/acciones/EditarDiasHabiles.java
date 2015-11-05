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
import sesionbeans.DiasNoHabilesFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class EditarDiasHabiles implements Action {

    DiasNoHabilesFacade diasNoHabilesFacade = lookupDiasNoHabilesFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.setAttribute("diasNoHabiles", diasNoHabilesFacade.findAll());
        return "diasHabiles/editarDiasHabiles.jsp";
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
