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
public class CrearPQRS2 implements Action {

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Reclamante r = (Reclamante) sesion.getAttribute("reclamante");
        String tipoPQRS = request.getParameter("tipo_solicitud");
        String dependencia = request.getParameter("dependencia");
        String notificar_mail = request.getParameter("notificar_mail");
        String descripcion = request.getParameter("descripcion");

        Area a = areaFacade.find(Integer.parseInt(dependencia));

        Pqrs pqrs = new Pqrs();
        pqrs.setTipo(tipoPQRS);
        pqrs.setNotificarMail(notificar_mail);
        pqrs.setDescripcion(descripcion);
        pqrs.setEstadoSolicitud("Verificacion PQRS");
        pqrs.setAreaIdarea(a);
        pqrs.setEstado("Activa");
        pqrs.setMedioIngreso("Web");
        java.util.Date date = new java.util.Date();
        pqrs.setFechaCreacion(date);
        pqrs.setReclamanteIdreclamante(r);
        
        Calendar fecha = Calendar.getInstance();
        int anio = fecha.get(Calendar.YEAR);
        //armamos el codigo
        String codigo = (tipoPQRS.equals("Peticion") ? "P" : tipoPQRS.equals("Queja") ? "Q" : tipoPQRS.equals("Reclamo") ? "R" : "S");
        codigo += anio;
        int consecutivo = pqrsFacade.consecutivo(anio) + 1;
        int longitud = String.valueOf(consecutivo).length();
        int ceros = 5 - longitud;
        for (int i = 0; i < ceros; i++) {
            codigo += "0";
        }
        codigo += consecutivo;

        pqrs.setCodigo(codigo);
        pqrsFacade.create(pqrs);

        sesion.setAttribute("ultimaPQRS", pqrsFacade.findUltimo("idpqrs").getIdpqrs());
        new JavaMail().sendMail();
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
