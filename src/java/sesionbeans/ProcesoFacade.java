/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sesionbeans;

import entidades.Proceso;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nelson
 */
@Stateless
public class ProcesoFacade extends AbstractFacade<Proceso> {
    @PersistenceContext(unitName = "pqrsPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProcesoFacade() {
        super(Proceso.class);
    }
    
}
