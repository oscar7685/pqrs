/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.ResponsableArea;
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

/**
 *
 * @author Nelson
 */
public class BuscarFuncionarios implements Action {

    AreaFacade areaFacade = lookupAreaFacadeBean();
    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();
    PqrsFacade pqrsFacade = lookupPqrsFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
      
        String dependencia = request.getParameter("dependencia");
        Area a = areaFacade.find(Integer.parseInt(dependencia));
        List<ResponsableArea> ra = responsableAreaFacade.findByList("areaIdarea", a);
        String aux = "";

        for (int i = 0; i < ra.size(); i++) {
            if (i == 0) {
                aux = "{\"id\":\"" + ra.get(i).getIdresponsableArea() + "\",\"valor\":\"" + ra.get(i).getNombre() + " " + ra.get(i).getApellido() + "\"}";
            } else {
                aux += ",{\"id\":\"" + ra.get(i).getIdresponsableArea() + "\",\"valor\":\"" + ra.get(i).getNombre() + " " + ra.get(i).getApellido() + "\"}";
            }

        }

        //ObjectMapper mapper = new ObjectMapper();
        //mapper.writeValue(new File("c:\\user.json"), ra);
        // System.out.println("jsonInString: " + jsonInString);
        return "[" + aux + "]";
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

}
