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
public class Loguear implements Action {

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String identificacion = request.getParameter("codigo");
        String password = request.getParameter("pass");
        HttpSession session = request.getSession();

        try {
            Reclamante r = reclamanteFacade.find(Integer.parseInt(identificacion));
            if (r != null && r.getPassword().equals(password)) {
                session.setAttribute("reclamante", r);
                return "1";
            } else {
                return "2";
            }

        } catch (Exception e) {
            return "2";
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
