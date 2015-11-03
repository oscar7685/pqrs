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
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class Loguear implements Action {

    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();
    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String identificacion = request.getParameter("codigo");
        String password = request.getParameter("pass");
        HttpSession session = request.getSession();

        try {
            ResponsableArea ra = responsableAreaFacade.find(Integer.parseInt(identificacion));
            if (ra != null && ra.getPassword().equals(password)) {
                session.setAttribute("responsableArea", ra);
                session.setAttribute("TipoUsuario", "responsableArea");
                return "1";
            } else {
                Reclamante r = reclamanteFacade.find(Integer.parseInt(identificacion));
                if (r != null && r.getPassword().equals(password)) {
                    session.setAttribute("reclamante", r);
                    session.setAttribute("TipoUsuario", "reclamante");
                    return "1";
                } else {
                    return "2";
                }
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

    private ResponsableAreaFacade lookupResponsableAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResponsableAreaFacade) c.lookup("java:global/pqrs/ResponsableAreaFacade!sesionbeans.ResponsableAreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
