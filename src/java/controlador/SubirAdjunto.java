/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.Pqrs;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sesionbeans.PqrsFacade;

/**
 *
 * @author Ususario
 */
public class SubirAdjunto extends HttpServlet {
    @EJB
    private PqrsFacade pqrsFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        PrintWriter writer = response.getWriter();

        response.setContentType("text/plain");
        int idUltimaPQRS = (int) sesion.getAttribute("ultimaPQRS");
        List<FileItem> items;
        try {
            items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {

                    FileItem actual = null;
                    actual = item;
                    String fileName = actual.getName();

                    String str = request.getSession().getServletContext().getRealPath("/adjuntos/");
                    fileName = idUltimaPQRS + "-" + fileName;
                    // nos quedamos solo con el nombre y descartamos el path
                    File fichero = new File(str + "\\" + fileName);

                    try {
                        // escribimos el fichero colgando del nuevo path
                        actual.write(fichero);
                        Pqrs pqrs = pqrsFacade.find(idUltimaPQRS);
                        pqrs.setAdjunto(fichero.getName());
                        pqrsFacade.edit(pqrs);
                       
                        String aux = "{\"name\":\"" + fichero.getName()
                                + "\",\"size\":\"" + 2000 + "\",\"url\":\"/pqrs/adjuntos/" + fichero.getName()
                                + "\",\"thumbnailUrl\":\"/pqrs/thumbnails/" + fichero.getName()
                                + "\",\"deleteUrl\":\"/pqrs/Subir?file=" + fichero.getName()
                                + "\",\"deleteType\":\"DELETE\",\"type\":\"" + fichero.getName() + "\"}";

                        writer.write("{\"files\":[" + "" + "]}");
                    } catch (Exception e) {
                    }
                }
            }
        } catch (Exception ex) {
        }
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
