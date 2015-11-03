/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.Asignacion;
import entidades.Pqrs;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
import sesionbeans.AsignacionFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class EditarPQRS2 implements Action {

    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();

    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Pqrs p = (Pqrs) sesion.getAttribute("pqrs");

        ResponsableArea asignador = (ResponsableArea) sesion.getAttribute("responsableArea");

        String dependencia = request.getParameter("dependencia");
        String funcionario = request.getParameter("funcionario");

        ResponsableArea ra = responsableAreaFacade.find(Integer.parseInt(funcionario));

        Area a = areaFacade.find(Integer.parseInt(dependencia));

        Asignacion as = new Asignacion();
        as.setAsignadoA(ra);
        as.setPqrsIdpqrs(p);
        as.setAsignadoPor(asignador);
        as.setFechaAsignacion(new Date());
        asignacionFacade.create(as);

        List<Asignacion> asignaciones = new ArrayList<Asignacion>();

        p.setAreaIdarea(a);
        p.setEstadoSolicitud("Asignado a dependencia");
        p.setAsignacionList(asignaciones);
        pqrsFacade.edit(p);

        JavaMail jm = new JavaMail();
        jm.setAsunto("Asignacion PQRS");
        jm.setMensage("Una PQRS le ha sido asignada, por favor ingrese al sistema para ver los detalles");
        jm.setTo(ra.getEmail());

        jm.sendMail();

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

    private AsignacionFacade lookupAsignacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AsignacionFacade) c.lookup("java:global/pqrs/AsignacionFacade!sesionbeans.AsignacionFacade");
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
