/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.ResponsableArea;
import entidades.Respuesta;
import interfaz.Action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.codehaus.jackson.map.ObjectMapper;
import sesionbeans.AreaFacade;
import sesionbeans.PqrsFacade;
import sesionbeans.ResponsableAreaFacade;
import sesionbeans.RespuestaFacade;

/**
 *
 * @author Oscar
 */
public class ResponderEncuesta implements Action {
    
    RespuestaFacade respuestaFacade = lookupRespuestaFacadeBean();
    
    AreaFacade areaFacade = lookupAreaFacadeBean();
    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String satisfaccion = request.getParameter("satisfaccion");
        String respuesta = request.getParameter("respuesta");
        
        Respuesta res = respuestaFacade.find(Integer.parseInt(respuesta));
        res.setEvaluacion(satisfaccion);
        respuestaFacade.edit(res);
        return "NA";
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
    
    private ResponsableAreaFacade lookupResponsableAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResponsableAreaFacade) c.lookup("java:global/pqrs/ResponsableAreaFacade!sesionbeans.ResponsableAreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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
    
    private RespuestaFacade lookupRespuestaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RespuestaFacade) c.lookup("java:global/pqrs/RespuestaFacade!sesionbeans.RespuestaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
}
