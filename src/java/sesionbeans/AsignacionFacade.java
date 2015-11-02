/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sesionbeans;

import entidades.Asignacion;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class AsignacionFacade extends AbstractFacade<Asignacion> {
    @PersistenceContext(unitName = "pqrsPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AsignacionFacade() {
        super(Asignacion.class);
    }
    
}
