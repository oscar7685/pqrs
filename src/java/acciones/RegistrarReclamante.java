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
import sesionbeans.ReclamanteFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class RegistrarReclamante implements Action {

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

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
            String modalidad = request.getParameter("modalidad");
            reclamante.setModalidad(modalidad);
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
                    + "Para confirmar tu cuenta por favor haz click en el siguiente enlace <a href='http://localhost:8080" + request.getContextPath() + "/Activar?id=" + identificacion + "'>Confirmar cuenta</a>";

            JavaMail jm = new JavaMail();
            jm.setAsunto("Confirmar cuenta PQRS");
            jm.setMensage(msg);
            jm.setCc(correo);
            jm.sendConfirmacion();
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
