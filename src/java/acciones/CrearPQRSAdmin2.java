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
import java.util.Calendar;
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
        Pqrs aux = pqrsFacade.findUltimo("idpqrs");
        sesion.setAttribute("ultimaPQRS", ""+aux.getIdpqrs());

        String msg = "NOTIFICACIÓN DE APERTURA PQRS - " + aux.getCodigo() + "\n"
                + "PETICIONARIO: " + aux.getReclamanteIdreclamante().getIdreclamante() + " - " + aux.getReclamanteIdreclamante().getNombre()
                + " " + aux.getReclamanteIdreclamante().getApellido() + "\n"
                + "\n"
                + "Estimado Usuario,\n"
                + "Hemos recibido su PQRS satisfactoriamente. Recibirá notificaciones a través de correo electrónico conforme al trámite de la misma.\n"
                + "Para verificar las novedades debe ingresar a la plataforma virtual y consultar el estado de su PQRS\n"
                + "_____________________________________________________________________________________________\n"
                + "\n"
                + "INFORMACIÓN REPORTADA\n"
                + "\n"
                + "TIPO: " + aux.getTipo() + "\n"
                + "\n"
                + "MODO DE INGRESO: " + aux.getMedioIngreso() + "\n"
                + "\n"
                + "Información de PQRS\n"
                + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "<" + aux.getReclamanteIdreclamante().getEmail() + "> " + formatoDelTexto.format(new Date()) + "\n"
                + "Responder a: " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "<" + aux.getReclamanteIdreclamante().getEmail() + "> " + "\n"
                + "Para: pqrs@unicartagena.edu.co\n"
                + "[Nombre y Apellidos Completos] " + aux.getReclamanteIdreclamante().getNombre() + " " + aux.getReclamanteIdreclamante().getApellido() + "\n"
                + "[Correo Electrónico] " + aux.getReclamanteIdreclamante().getEmail() + "\n"
                + "[No. de Identificación] " + aux.getReclamanteIdreclamante().getIdreclamante() + "\n"
                + "[Teléfono / Celular] " + aux.getReclamanteIdreclamante().getCelular() + "\n"
                + "[Es usted] " + aux.getReclamanteIdreclamante().getTipo() + "\n"
                + "[Asunto] " + aux.getTipo() + "\n"
                + "[Dependencia a la que dirige la PQRS] " + aux.getAreaIdarea().getNombre() + "\n"
                + "[Comentario] " + aux.getDescripcion() + "\n"
                + "\n"
                + "Agradecemos la utilización del procedimiento de peticiones, quejas, reclamos y sugerencias, lo que sin duda contribuye al mejoramiento continuo de nuestra Institución.\n"
                + "Cordialmente,\n"
                + "\n"
                + "SECRETARIA GENERAL\n"
                + "UNIVERSIDAD DE CARTAGENA\n"
                + formatoDelTexto.format(new Date());


        JavaMail jm = new JavaMail();
        jm.setAsunto("Apertura de PQRS - " + aux.getCodigo());
        jm.setMensage(msg);
        jm.setTo("" + aux.getReclamanteIdreclamante().getEmail());
        jm.setCc("micuenta40@gmail.com");
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
