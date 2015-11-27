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
public class EditarReclamante implements Action {

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Reclamante reclamante = (Reclamante) sesion.getAttribute("peticionario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String celular = request.getParameter("celular");
        String tipo_usuario = request.getParameter("tipo_usuario");
        String correo = request.getParameter("correo");
       

       
        reclamante.setNombre(nombre);
        reclamante.setApellido(apellido);
    
        reclamante.setCelular(celular);
        reclamante.setTipo(tipo_usuario);
        reclamante.setEmail(correo);
        
        try {
            reclamanteFacade.edit(reclamante);
            return "1";
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
