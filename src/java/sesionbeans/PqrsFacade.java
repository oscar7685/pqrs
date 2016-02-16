/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sesionbeans;

import entidades.Pqrs;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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

    public int consecutivo(int anio) {
        Date f1 = new GregorianCalendar(anio, 1, 1).getTime();
        Date f2 = new GregorianCalendar(anio, 12, 31).getTime();
        Query q = em.createNamedQuery("Pqrs.findByAnio");
        q.setParameter("f1", f1);
        q.setParameter("f2", f2);
        return ((Long) q.getSingleResult()).intValue();
    }

}
