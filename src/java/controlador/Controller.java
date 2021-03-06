/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import interfaz.Action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author Ususario
 */
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private final static Logger LOGGER = Logger.getLogger(Controller.class);
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {
            ResourceBundle rb = ResourceBundle.getBundle("propiedades/action");
            String action = request.getParameter("accion");
            String clase = rb.getString(action);
            Action objeto = (Action) Class.forName(clase).newInstance();
            String ruta = objeto.procesar(request);

            int longitudRuta = ruta.length();
            if (ruta.startsWith("[")) {
                response.setContentType("application/json");
                out.print(ruta);
            } else if (longitudRuta > 2) {
                RequestDispatcher rd = request.getRequestDispatcher(ruta);
                rd.forward(request, response);
            } else if (longitudRuta == 2 && ruta.equals("NA")) {
                //NO pasa nada
            } else if (isNumeric(ruta)) {
                out.print(ruta);
            }

        } catch (Exception e) {
            LOGGER.error("Se ha presentado un error", e);
            RequestDispatcher rd = request.getRequestDispatcher("error2.jsp");
            rd.forward(request, response);
        }
    }

    public static boolean isNumeric(String str) {
        try {
            int d = Integer.parseInt(str);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
