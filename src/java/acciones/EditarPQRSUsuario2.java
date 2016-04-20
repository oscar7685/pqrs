/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.Pqrs;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sesionbeans.AreaFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class EditarPQRSUsuario2 implements Action {

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Pqrs pqrs = (Pqrs) sesion.getAttribute("pqrs");
        String descripcion = request.getParameter("descripcion");

        String descripcionAnterior = pqrs.getDescripcion();

        if (!descripcionAnterior.trim().equals(descripcion.trim())) {
            pqrs.setDescripcion(descripcion);
            pqrsFacade.edit(pqrs);

            JavaMail jm = new JavaMail();
            jm.setAsunto("PQRS editada por el usuario");
            jm.setTo("micuenta40@gmail.com");
            jm.setMensage("El usuario " + pqrs.getReclamanteIdreclamante().getNombre() + " " + pqrs.getReclamanteIdreclamante().getApellido()
                    + " editó la PQRS numero:" + pqrs.getCodigo()
                    + " cambiando la descripción de '" + descripcionAnterior + "' a '" + descripcion + "'");
        }

        return "NA";

    }

    private AreaFacade lookupAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AreaFacade) c.lookup("java:global/pqrs/AreaFacade!sesionbeans.AreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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
