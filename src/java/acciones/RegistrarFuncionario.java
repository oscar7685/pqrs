/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import entidades.Area;
import entidades.ResponsableArea;
import interfaz.Action;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import sesionbeans.AreaFacade;
import sesionbeans.ResponsableAreaFacade;

/**
 *
 * @author Ususario
 */
public class RegistrarFuncionario implements Action {

    ResponsableAreaFacade responsableAreaFacade = lookupResponsableAreaFacadeBean();

    AreaFacade areaFacade = lookupAreaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String identificacion = request.getParameter("identificacion");
        String celular = request.getParameter("celular");
        String dependencia = request.getParameter("dependencia");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        Area a = areaFacade.find(Integer.parseInt(dependencia));

        ResponsableArea funcionario = new ResponsableArea();
        funcionario.setNombre(nombre);
        funcionario.setApellido(apellido);
        funcionario.setIdresponsableArea(Integer.parseInt(identificacion));
        funcionario.setCelular(celular);
        funcionario.setAreaIdarea(a);
        funcionario.setEmail(correo);
        funcionario.setPassword(password);
        try {
            responsableAreaFacade.create(funcionario);
            return "1";
        } catch (Exception e) {
            return "2";
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

    private ResponsableAreaFacade lookupResponsableAreaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResponsableAreaFacade) c.lookup("java:global/pqrs/ResponsableAreaFacade!sesionbeans.ResponsableAreaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
