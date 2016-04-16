/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import entidades.Area;
import entidades.Asignacion;
import entidades.Pqrs;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.File;
import java.io.FileOutputStream;
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
import sesionbeans.AreaFacade;
import sesionbeans.AsignacionFacade;
import sesionbeans.PqrsFacade;
import utils.JavaMail;

/**
 *
 * @author Ususario
 */
public class EnviarRecordatorio implements Action {

    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idAsignacion = request.getParameter("id");
        Asignacion a = asignacionFacade.find(Integer.parseInt(idAsignacion));

        String ruta = System.getProperty("user.dir") + "/recordatorio.pdf";
        Document documento;
        PdfWriter writer = null;
        documento = new Document(PageSize.LETTER, 80, 80, 75, 75);
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");

        a.setRequerimiento(new Integer("1"));// recordatorio enviado
        asignacionFacade.edit(a);
        try {
            //Obtenemos la instancia del archivo a utilizar
            writer = PdfWriter.getInstance(documento, new FileOutputStream(ruta));
            documento.open();
            documento.newPage();

            Paragraph parrafo = new Paragraph();
            Paragraph parrafo2 = new Paragraph();
            parrafo.setAlignment(Paragraph.ALIGN_CENTER);
            parrafo2.setAlignment(Paragraph.ALIGN_JUSTIFIED);
            parrafo.setFont(FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK));
            parrafo2.setFont(FontFactory.getFont("Arial", 12, Font.NORMAL, BaseColor.BLACK));
            parrafo.add("RECORDATORIO PQRS - " + a.getPqrsIdpqrs().getCodigo() + "\n");
            parrafo2.add("\n");
            parrafo2.add("PARA: " + a.getAsignadoA().getIdresponsableArea() + " ­ " + a.getAsignadoA().getAreaIdarea().getNombre());
            parrafo2.add("\n\n");
            parrafo2.add("Estimado Funcionario.\n\n");
            parrafo2.add("En cumplimiento del procedimiento de peticiones, quejas, reclamos y sugerencias, le recordamos que se encuentra una PQRS “en proceso” asignada a su dependencia, la cual vence al término de los tres (3) días siguientes al recibo de este correo.\n"
                    + "\n"
                    + "El Procedimiento de Peticiones, Quejas, Reclamos y Sugerencias,  es una herramienta que contribuye al mejoramiento continuo de nuestra Institución. Agradecemos su utilización.\n"
                    + "Cordialmente,\n"
                    + "\n"
                    + "SECRETARÍA GENERAL\n"
                    + "UNIVERSIDAD DE CARTAGENA.\n");
            parrafo2.add("" + formatoDelTexto.format(new Date()));
            documento.add(parrafo);
            documento.add(parrafo2);
            documento.close(); //Cerramos el documento
            writer.close(); //Cerramos writer

            JavaMail jm = new JavaMail();
            jm.setAsunto("RECORDATORIO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setMensage("RECORDATORIO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setTo("" + a.getAsignadoA().getEmail());
            jm.setCc("" + "micuenta40@gmail.com");
            jm.sendRecordatorio();

        } catch (Exception ex) {
            ex.getMessage();
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

    private AsignacionFacade lookupAsignacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AsignacionFacade) c.lookup("java:global/pqrs/AsignacionFacade!sesionbeans.AsignacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
