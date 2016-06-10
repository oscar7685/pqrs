/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Pqrs;
import interfaz.Action;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import sesionbeans.PqrsFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class ComportamientoFragmento implements Action {

    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        String finicio = request.getParameter("inicio");
        String ffinal = request.getParameter("final");

        String f1[] = finicio.split("-");
        String f2[] = ffinal.split("-");

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Calendar cal1 = Calendar.getInstance();
        cal1.set(Calendar.YEAR, Integer.parseInt(f1[0]));
        cal1.set(Calendar.MONTH, Integer.parseInt(f1[1]) - 1);
        cal1.set(Calendar.DAY_OF_MONTH, Integer.parseInt(f1[2]));
        Date start = cal1.getTime();

        cal1.set(Calendar.YEAR, Integer.parseInt(f2[0]));
        cal1.set(Calendar.MONTH, Integer.parseInt(f2[1]) - 1);
        cal1.set(Calendar.DAY_OF_MONTH, Integer.parseInt(f2[2]));
        Date end = cal1.getTime();

        String meses[] = {"enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"};

        int totalPQRS = pqrsFacade.countPqrs(start, end);
        int CantP = pqrsFacade.countPqrsRecibidas("Peticion", start, end);
        int CantQ = pqrsFacade.countPqrsRecibidas("Queja", start, end);
        int CantR = pqrsFacade.countPqrsRecibidas("Reclamo", start, end);
        int CantS = pqrsFacade.countPqrsRecibidas("Sugerencia", start, end);
        int CantPr = pqrsFacade.countPqrsRespondidas("Peticion", start, end, "Respuesta enviada al usuario");
        int CantQr = pqrsFacade.countPqrsRespondidas("Queja", start, end, "Respuesta enviada al usuario");
        int CantRr = pqrsFacade.countPqrsRespondidas("Reclamo", start, end, "Respuesta enviada al usuario");
        int CantSr = pqrsFacade.countPqrsRespondidas("Sugerencia", start, end, "Respuesta enviada al usuario");


        sesion.setAttribute("totalPQRS", totalPQRS);
        sesion.setAttribute("CantP", CantP);
        sesion.setAttribute("CantQ", CantQ);
        sesion.setAttribute("CantR", CantR);
        sesion.setAttribute("CantS", CantS);
        sesion.setAttribute("CantPr", CantPr);
        sesion.setAttribute("CantQr", CantQr);
        sesion.setAttribute("CantRr", CantRr);
        sesion.setAttribute("CantSr", CantSr);

        List<Pqrs> peticiones = pqrsFacade.findPQRSxTipoyRango("Peticion", start, end);
        List<Pqrs> Quejas = pqrsFacade.findPQRSxTipoyRango("Queja", start, end);
        List<Pqrs> Reclamos = pqrsFacade.findPQRSxTipoyRango("Reclamo", start, end);
        List<Pqrs> Sugerencias = pqrsFacade.findPQRSxTipoyRango("Sugerencia", start, end);

        int[] mesesP = new int[12];
        int[] mesesQ = new int[12];
        int[] mesesR = new int[12];
        int[] mesesS = new int[12];

        for (Pqrs p : peticiones) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesP[month]++;
        }
        for (Pqrs p : Quejas) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesQ[month]++;
        }
        for (Pqrs p : Reclamos) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesR[month]++;
        }
        for (Pqrs p : Sugerencias) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(p.getFechaCreacion());
            int month = cal.get(Calendar.MONTH);
            mesesS[month]++;
        }

        sesion.setAttribute("Peticion", mesesP);
        sesion.setAttribute("Queja", mesesQ);
        sesion.setAttribute("Reclamo", mesesR);
        sesion.setAttribute("Sugerencia", mesesS);

        sesion.setAttribute("total", totalPQRS);

        sesion.setAttribute("Web", pqrsFacade.findMedio("Web", start, end));
        sesion.setAttribute("Correo", pqrsFacade.findMedio("Correo", start, end));
        sesion.setAttribute("Telefono", pqrsFacade.findMedio("Telefono", start, end));
        sesion.setAttribute("Manual", pqrsFacade.findMedio("Manual", start, end));
        sesion.setAttribute("Verbal", pqrsFacade.findMedio("Verbal", start, end));
        sesion.setAttribute("Fax", pqrsFacade.findMedio("Fax", start, end));
        sesion.setAttribute("total", totalPQRS);

        sesion.setAttribute("Aspirante", pqrsFacade.findTipoReclamante("ASPIRANTE", start, end));
        sesion.setAttribute("Docente", pqrsFacade.findTipoReclamante("PROFESOR", start, end));
        sesion.setAttribute("Egresado", pqrsFacade.findTipoReclamante("EGRESADO", start, end));
        sesion.setAttribute("Estudiante", pqrsFacade.findTipoReclamante("ESTUDIANTE", start, end));
        sesion.setAttribute("Particular", pqrsFacade.findTipoReclamante("PARTICULAR", start, end));
        sesion.setAttribute("total", totalPQRS);

        sesion.setAttribute("recibidas", totalPQRS);
        sesion.setAttribute("remitidas", pqrsFacade.findRemitidas(start, end));
        sesion.setAttribute("respondidas", pqrsFacade.findRespondidas(start, end));
        sesion.setAttribute("pertinentes", pqrsFacade.findByPertinentes(start, end));
        sesion.setAttribute("meses", meses);


        int total = 0;
        List<Integer> cantidadXProceso = new ArrayList<Integer>();
        List procesos = new ArrayList();


        String fini = "";
        String ffin = "";

        fini = format.format(start);
        ffin = format.format(end);

        //PROCESOS MAS AFECTADOS
        List<Object[]> procesoMasAfectados = pqrsFacade.findProcesosMasAfectados(fini, ffin);
        if (procesoMasAfectados.size() > 0) {
            for (Object[] objects : procesoMasAfectados) {
                procesos.add(objects[0].toString());
                cantidadXProceso.add(Integer.parseInt(objects[1].toString()));
                total += Integer.parseInt(objects[1].toString());
            }
        }

        sesion.setAttribute("procesos", procesos);
        sesion.setAttribute("cantidadXProceso", cantidadXProceso);
        sesion.setAttribute("total", total);

        return "informes/fragmentoComportamiento.jsp";

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
