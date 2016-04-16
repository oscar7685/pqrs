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
public class Enviar1erRequerimiento implements Action {

    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idAsignacion = request.getParameter("id");
        Asignacion a = asignacionFacade.find(Integer.parseInt(idAsignacion));

        String ruta = System.getProperty("user.dir") + "/requerimiento1.pdf";
        Document documento;
        PdfWriter writer = null;
        documento = new Document(PageSize.LETTER, 80, 80, 75, 75);
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");

        a.setRequerimiento(new Integer("2"));//primer requerimiento enviado
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
            parrafo.add("PRIMER REQUERIMIENTO PQRS - " + a.getPqrsIdpqrs().getCodigo() + "\n");
            parrafo2.add("\n");
            parrafo2.add("PARA: " + a.getAsignadoA().getIdresponsableArea() + " ­ " + a.getAsignadoA().getAreaIdarea().getNombre());
            parrafo2.add("\n\n");
            parrafo2.add("Estimado Funcionario.\n\n");
            parrafo2.add("En cumplimiento del procedimiento de peticiones, quejas, reclamos y sugerencias liderado por la Secretaría General, y teniendo en cuenta que no existe evidencia del trámite dado a la petición presentada por " + a.getPqrsIdpqrs().getReclamanteIdreclamante().getNombre() + " " + a.getPqrsIdpqrs().getReclamanteIdreclamante().getApellido() 
                    + " (PQRS con  código: " + a.getPqrsIdpqrs().getCodigo()
                    + "), asignada a usted oportunamente por plataforma virtual, solicito a usted se sirva informar si se dio o no trámite a la misma.\n"
                    + " \n"
                    + "En caso de no haberse dado respuesta, agradecemos explicar los motivos para ello.\n"
                    + " \n"
                    + "En caso de haberse tramitado, agradezco a usted enviar copia de la respuesta dada o, si no fue adelantado trámite alguno, sírvase emitir la respuesta que corresponda e informarlo a esta Secretaría o al correo electrónico pqrs@unicartagena.edu.co.\n"
                    + " \n"
                    + "En consecuencia solicitamos presentar el informe requerido dentro de los dos (2) días hábiles siguientes al recibo del presente oficio conforme a lo establecido en el procedimiento.\n"
                    + " \n"
                    + "Finalmente, es pertinente recordar que es deber de los servidores públicos atender las PQRS y su no atención puede ocasionar sanciones o acciones contra la Institución."
                    + "\nCordialmente,\n"
                    + "\n"
                    + "SECRETARÍA GENERAL\n"
                    + "UNIVERSIDAD DE CARTAGENA.\n");
            parrafo2.add("" + formatoDelTexto.format(new Date()));
            documento.add(parrafo);
            documento.add(parrafo2);
            documento.close(); //Cerramos el documento
            writer.close(); //Cerramos writer

            JavaMail jm = new JavaMail();
            jm.setAsunto("PRIMER REQUERIMIENTO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setMensage("PRIMER REQUERIMIENTO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setTo("" + a.getAsignadoA().getEmail());
            jm.setCc("" + "micuenta40@gmail.com");
            jm.send1erRequerimiento();

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
