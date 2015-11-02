/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sesionbeans;

import entidades.ResponsableArea;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class ResponsableAreaFacade extends AbstractFacade<ResponsableArea> {
    @PersistenceContext(unitName = "pqrsPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResponsableAreaFacade() {
        super(ResponsableArea.class);
    }
    
}
