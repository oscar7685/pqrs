/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *

 */
public interface Action {

    public String procesar(HttpServletRequest request)
            throws IOException, ServletException;
}
