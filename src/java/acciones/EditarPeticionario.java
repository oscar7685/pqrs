/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
 * @author Oscar
 */
public class EditarPeticionario implements Action {

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idP = request.getParameter("id");
        Reclamante r = reclamanteFacade.find(Integer.parseInt(idP));
        sesion.setAttribute("peticionario", r);

        return "peticionario/editar.jsp";
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
