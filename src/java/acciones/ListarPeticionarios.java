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
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class ListarPeticionarios implements Action {
    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();


    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();

        session.setAttribute("peticionarios", reclamanteFacade.findAll());
        return "peticionario/listar.jsp";



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
