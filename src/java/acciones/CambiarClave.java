/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Reclamante;
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
import sesionbeans.ReclamanteFacade;

/**
 *
 * @author Ususario
 */
public class CambiarClave implements Action {
    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Reclamante r = (Reclamante) sesion.getAttribute("reclamante");
        String actual = request.getParameter("actual");
        String nueva1 = request.getParameter("nueva1");
        String nueva2 = request.getParameter("nueva2");

        if (r.getPassword().equals(actual)) {
            if (nueva1.equals(nueva2)) {
                r.setPassword(nueva1);
                reclamanteFacade.edit(r);
                return "0";
            } else {
                return "1";
            }
        } else {
            return "1";
        }

    }

    private ReclamanteFacade lookupReclamanteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ReclamanteFacade) c.lookup("java:global/pqrs/ReclamanteFacade!sesionbeans.ReclamanteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
