/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sesionbeans;

import entidades.Pqrs;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class PqrsFacade extends AbstractFacade<Pqrs> {
    @PersistenceContext(unitName = "pqrsPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PqrsFacade() {
        super(Pqrs.class);
    }
    
}
