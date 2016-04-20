/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Programa;
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
import sesionbeans.ProgramaFacade;
import sesionbeans.ReclamanteFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class RegistrarReclamante implements Action {
    ProgramaFacade programaFacade = lookupProgramaFacadeBean();

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();
    private final static org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(RegistrarReclamante.class);

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String identificacion = request.getParameter("identificacion");
        String celular = request.getParameter("celular");
        String tipo_usuario = request.getParameter("tipo_usuario");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        Reclamante reclamante = new Reclamante();
        if (tipo_usuario.equals("ESTUDIANTE")) {
            String programa = request.getParameter("programa");
            Programa prog = programaFacade.find(Integer.parseInt(programa));
            reclamante.setProgramaIdprograma(prog);
        }
        reclamante.setNombre(nombre);
        reclamante.setApellido(apellido);
        reclamante.setIdreclamante(Integer.parseInt(identificacion));
        reclamante.setCelular(celular);
        reclamante.setTipo(tipo_usuario);
        reclamante.setEmail(correo);
        reclamante.setPassword(password);
        reclamante.setEstado("inactivo");
        try {
            reclamanteFacade.create(reclamante);
            String msg = "Bienvenido a PQRS<br/>"
                    + "Para confirmar tu cuenta por favor haz click en el siguiente enlace <a href='http:" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Activar?id=" + identificacion + "'>Confirmar cuenta</a>";

            JavaMail jm = new JavaMail();
            jm.setAsunto("Confirmar cuenta PQRS");
            jm.setMensage(msg);
            jm.setCc(correo);
            jm.sendConfirmacion();
            return "1";
        } catch (Exception e) {
            LOGGER.error("Se ha presentado un error", e);
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

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/pqrs/ProgramaFacade!sesionbeans.ProgramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
