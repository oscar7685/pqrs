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
import java.text.SimpleDateFormat;
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
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class CrearPQRSAdmin2 implements Action {

    ReclamanteFacade reclamanteFacade = lookupReclamanteFacadeBean();

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        String tipoPQRS = request.getParameter("tipo_solicitud");
        String dependencia = request.getParameter("dependencia");
        String notificar_mail = request.getParameter("notificar_mail");
        String descripcion = request.getParameter("descripcion");
        String medio = request.getParameter("medio");
        String peticionario = request.getParameter("peticionario");
        String fechaCreacion = request.getParameter("fechaCreacion");

        Area a = areaFacade.find(Integer.parseInt(dependencia));
        Reclamante r = reclamanteFacade.find(Integer.parseInt(peticionario));

        Pqrs pqrs = new Pqrs();
        pqrs.setTipo(tipoPQRS);
        pqrs.setNotificarMail(notificar_mail);
        pqrs.setDescripcion(descripcion);
        pqrs.setEstadoSolicitud("Verificacion PQRS");
        pqrs.setAreaIdarea(a);
        pqrs.setEstado("Activa");
        pqrs.setMedioIngreso(medio);

        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaI = null;
        try {

            fechaI = formatoDelTexto.parse(fechaCreacion);

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        pqrs.setFechaCreacion(fechaI);

        pqrs.setReclamanteIdreclamante(r);
        pqrsFacade.create(pqrs);

        sesion.setAttribute("ultimaPQRS", pqrsFacade.findUltimo("idpqrs").getIdpqrs());

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
