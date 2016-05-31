/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sesionbeans;

import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TemporalType;

/**
 *
 * @author Ususario
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected abstract EntityManager getEntityManager();

    public void create(T entity) {
        getEntityManager().persist(entity);
    }

    public void edit(T entity) {
        getEntityManager().merge(entity);
    }

    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    public List<T> findAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

    public List<T> findRange(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    public List<T> findRange2(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName()+ " c  ORDER BY c.idpqrs ASC", entityClass);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    public int count() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }

    public int countPqrs(Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT COUNT(c) FROM "
                + entityClass.getSimpleName() + " c WHERE c.fechaCreacion "
                + "BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("finicio", finicio);
        q.setParameter("ffinal", ffinal);
        return ((Long) q.getSingleResult()).intValue();
    }
    public int countPqrsRecibidas(String tipo, Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT COUNT(c) FROM "
                + entityClass.getSimpleName() + " c WHERE c.tipo = :tipo and "
                + "c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("tipo", tipo);
        q.setParameter("finicio", finicio);
        q.setParameter("ffinal", ffinal);
        return ((Long) q.getSingleResult()).intValue();
    }

    public int countPqrsRespondidas(String tipo, Date finicio, Date ffinal, String estado) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT COUNT(c) FROM "
                + entityClass.getSimpleName() + " c WHERE c.tipo = :tipo "
                + "and c.fechaCreacion BETWEEN :finicio and :ffinal and c.estadoSolicitud = :estado", entityClass);
        q.setParameter("tipo", tipo);
        q.setParameter("estado", estado);
        q.setParameter("finicio", finicio);
        q.setParameter("ffinal", ffinal);
        return ((Long) q.getSingleResult()).intValue();
    }

    public List<T> findByList(String property, Object m) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property + " = :name", entityClass);
        q.setParameter("name", m);
        return q.getResultList();
    }

    public List<T> findTipoReclamante(String tipo, Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName()
                + " c WHERE c.reclamanteIdreclamante.tipo = :tipo "
                + "and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("tipo", tipo);
        q.setParameter("finicio", finicio);
        q.setParameter("ffinal", ffinal);
        return q.getResultList();
    }

    public List<T> findMedio(String medio, Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName()
                + " c WHERE c.medioIngreso= :medio "
                + "and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("medio", medio);
        q.setParameter("finicio", finicio);
        q.setParameter("ffinal", ffinal);
        return q.getResultList();
    }

    public List<T> findPQRSxTipoyRango(String tipo, Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM  Pqrs c WHERE c.tipo = :tipo and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("tipo", tipo);
        q.setParameter("finicio", finicio, TemporalType.DATE);
        q.setParameter("ffinal", ffinal, TemporalType.DATE);
        return q.getResultList();
    }

    public List<T> findByList2(String property1, Object m1, String property2, Object m2) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property1 + " = :name1 and c." + property2 + " = :name2", entityClass);
        q.setParameter("name1", m1);
        q.setParameter("name2", m2);
        return q.getResultList();
    }

    public int findRemitidas(Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT count(c) FROM " + entityClass.getSimpleName()
                + " c WHERE c.estadoSolicitud <> 'Verificacion PQRS'"
                + " and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("finicio", finicio, TemporalType.DATE);
        q.setParameter("ffinal", ffinal, TemporalType.DATE);
        return ((Long) q.getSingleResult()).intValue();
    }

    public int findRespondidas(Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT count(c) FROM " + entityClass.getSimpleName()
                + " c WHERE c.estadoSolicitud = 'Respuesta enviada al usuario'"
                + " and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("finicio", finicio, TemporalType.DATE);
        q.setParameter("ffinal", ffinal, TemporalType.DATE);
        return ((Long) q.getSingleResult()).intValue();
    }

    public int findByPertinentes(Date finicio, Date ffinal) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT count(c) FROM " + entityClass.getSimpleName()
                + " c  JOIN c.respuestaList r WHERE c.estadoSolicitud ='Respuesta enviada al usuario' "
                + " and (r.evaluacion = '5' or r.evaluacion = '4')"
                + " and c.fechaCreacion BETWEEN :finicio and :ffinal", entityClass);
        q.setParameter("finicio", finicio, TemporalType.DATE);
        q.setParameter("ffinal", ffinal, TemporalType.DATE);
        return ((Long) q.getSingleResult()).intValue();
    }

    public T findUltimo(String id) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c  ORDER BY c." + id + " DESC", entityClass);
        q.setMaxResults(1);
        return (T) q.getSingleResult();
    }

    public void removeAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("DELETE FROM " + entityClass.getSimpleName() + " m", entityClass);
        q.executeUpdate();
    }

    public void removeWhereDate(Date d) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("DELETE FROM " + entityClass.getSimpleName() + " m where m.dias=:dia", entityClass);
        q.setParameter("dia", d);
        q.executeUpdate();
    }

    public T findWhereDate(Date d) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        try {
            Query q = getEntityManager().createQuery("SELECT m FROM " + entityClass.getSimpleName() + " m where m.dias=:dia", entityClass);
            q.setParameter("dia", d);
            q.setMaxResults(1);
            return (T) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }
}
