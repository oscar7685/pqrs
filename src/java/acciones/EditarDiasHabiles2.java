/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.DiasNoHabiles;
import entidades.Reclamante;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
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
import sesionbeans.DiasNoHabilesFacade;
import sesionbeans.ReclamanteFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class EditarDiasHabiles2 implements Action {
    
    DiasNoHabilesFacade diasNoHabilesFacade = lookupDiasNoHabilesFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String fechas1 = request.getParameter("fechas");
        String[] fechas = fechas1.split(",");
        
       // long tiempoInicio = System.currentTimeMillis();

        //diasNoHabilesFacade.removeAll();
        Collection nuevos = new ArrayList<Date>();
        Collection viejos = new ArrayList<Date>();
        
        List<DiasNoHabiles> diasNoH = diasNoHabilesFacade.findAll();
        
        for (DiasNoHabiles diasNoH1 : diasNoH) {
            viejos.add(diasNoH1.getDias());
        }
        
        List<Date> dates = new ArrayList<Date>();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
        for (int i = 0; i < fechas.length; i++) {
            try {
                Date aux = formatter.parse(fechas[i]);
                nuevos.add(aux);
            } catch (ParseException ex) {
                Logger.getLogger(EditarDiasHabiles2.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        Collection viejos2 = new ArrayList(viejos);
        viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
        nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

        for (Object viejos21 : viejos) {
            diasNoHabilesFacade.removeWhereDate((Date) viejos21);
        }
        
        for (Object nuevo2 : nuevos) {
            DiasNoHabiles aux = new DiasNoHabiles();
            aux.setDias((Date) nuevo2);
            diasNoHabilesFacade.create(aux);
        }

        /*List<Date> dates = new ArrayList<Date>();
         SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
         for (int i = 0; i < fechas.length; i++) {
         try {
         Date aux = formatter.parse(fechas[i]);
         DiasNoHabiles dnh = new DiasNoHabiles();
         dnh.setDias(aux);
         diasNoHabilesFacade.create(dnh);
         } catch (ParseException ex) {
         Logger.getLogger(EditarDiasHabiles2.class.getName()).log(Level.SEVERE, null, ex);
         }
         }*/
        /*long tiempoFinal = System.currentTimeMillis() - tiempoInicio;
        System.out.println("El tiempo de demora es :" + tiempoFinal + " miliseg");*/
        
        System.out.println("");
        //session.setAttribute("diasNoHabiles", diasNoHabilesFacade.findAll());
        return "NA";
    }
    
    private DiasNoHabilesFacade lookupDiasNoHabilesFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DiasNoHabilesFacade) c.lookup("java:global/pqrs/DiasNoHabilesFacade!sesionbeans.DiasNoHabilesFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
}
