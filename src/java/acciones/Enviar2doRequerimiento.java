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
public class Enviar2doRequerimiento implements Action {

    AsignacionFacade asignacionFacade = lookupAsignacionFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idAsignacion = request.getParameter("id");
        Asignacion a = asignacionFacade.find(Integer.parseInt(idAsignacion));

        String ruta = System.getProperty("user.dir") + "/requerimiento2.pdf";
        Document documento;
        PdfWriter writer = null;
        documento = new Document(PageSize.LETTER, 80, 80, 75, 75);
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");

        a.setRequerimiento(new Integer("3"));//primer requerimiento enviado
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
            parrafo.add("SEGUNDO REQUERIMIENTO PQRS - " + a.getPqrsIdpqrs().getCodigo() + "\n");
            parrafo2.add("\n");
            parrafo2.add("PARA: " + a.getAsignadoA().getIdresponsableArea() + " ­ " + a.getAsignadoA().getAreaIdarea().getNombre());
            parrafo2.add("\n\n");
            parrafo2.add("Distinguido Doctor,\n\n");
            parrafo2.add("El Procedimiento de Peticiones, Quejas, Reclamos y Sugerencias se encuentra enmarcado dentro del proceso estratégico de gestión de relaciones con usuarios y ciudadanos, que integra el sistema de calidad de la Universidad de Cartagena. Está concebido para la recepción, distribución, control eficiente y eficaz con una adecuada atención y solución integral de las quejas, reclamos y sugerencias realizadas por la comunidad universitaria y ciudadanía en general, que satisfaga sus necesidades y retroalimente el sistema de mejoramiento continuo.\n"
                    + " \nPor tanto, es imperiosa la atención y cumplimiento estricto de las etapas de este procedimiento aprobado dentro de nuestro sistema de calidad, que se constituye en el insumo básico para la elaboración de los planes de mejoramiento de la institución.\n"
                    + " \nEn cumplimiento de este procedimiento, liderado por la Secretaría General, y teniendo en cuenta que no existía evidencia del trámite dado a la PQRS presentada por "
                    + a.getPqrsIdpqrs().getReclamanteIdreclamante().getNombre() + " " + a.getPqrsIdpqrs().getReclamanteIdreclamante().getApellido()
                    + " (PQRS numero: " + a.getPqrsIdpqrs().getCodigo() + "), remitida a usted oportunamente por ser de su competencia mediante oficio SG- 051-2016, "
                    + "se le solicitó información del trámite dado a la misma mediante oficio SG- 093-2016."
                    + "\n"
                    + "Dado que a la fecha no existe evidencia de la respuesta dada a esta PQRS, solicitamos información sobre la atención a la misma. En caso de haberse tramitado, agradecemos a usted enviar copia de la respuesta dada. En caso de no haberse adelantado trámite alguno, solicitamos emitir las respuestas que correspondan e informarlo a esta Secretaría.\n"
                    + " \nAgradecemos el informe sobre el particular a más tardar dentro del día siguiente al recibo del presente oficio.\n"
                    + " \n"
                    + " \n"
                    + "Finalmente, es pertinente recordar que es deber de los servidores públicos atender los PQRS y su no atención puede ocasionar sanciones o acciones contra la Institución."
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
            jm.setAsunto("SEGUNDO REQUERIMIENTO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setMensage("SEGUNDO REQUERIMIENTO PQRS ­ " + a.getPqrsIdpqrs().getCodigo());
            jm.setTo("" + a.getAsignadoA().getEmail());
            jm.setCc("" + "micuenta40@gmail.com");
            jm.send2doRequerimiento();

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
