/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "asignacion", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Asignacion.findAll", query = "SELECT a FROM Asignacion a"),
    @NamedQuery(name = "Asignacion.findByAsignacionId", query = "SELECT a FROM Asignacion a WHERE a.asignacionId = :asignacionId"),
    @NamedQuery(name = "Asignacion.findByFechaAsignacion", query = "SELECT a FROM Asignacion a WHERE a.fechaAsignacion = :fechaAsignacion")})
public class Asignacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "asignacion_id")
    private Integer asignacionId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_asignacion")
    @Temporal(TemporalType.DATE)
    private Date fechaAsignacion;
    @JoinColumn(name = "asignado_a", referencedColumnName = "idresponsable_area")
    @ManyToOne(optional = false)
    private ResponsableArea asignadoA;
    @JoinColumn(name = "asignado_por", referencedColumnName = "idresponsable_area")
    @ManyToOne(optional = false)
    private ResponsableArea asignadoPor;
    @JoinColumn(name = "pqrs_idpqrs", referencedColumnName = "idpqrs")
    @ManyToOne(optional = false)
    private Pqrs pqrsIdpqrs;
    @Column(name = "requerimiento")
    private Integer requerimiento;

    public Integer getRequerimiento() {
        return requerimiento;
    }

    public void setRequerimiento(Integer requerimiento) {
        this.requerimiento = requerimiento;
    }

    public Asignacion() {
    }

    public Asignacion(Integer asignacionId) {
        this.asignacionId = asignacionId;
    }

    public Asignacion(Integer asignacionId, Date fechaAsignacion) {
        this.asignacionId = asignacionId;
        this.fechaAsignacion = fechaAsignacion;
    }

    public Integer getAsignacionId() {
        return asignacionId;
    }

    public void setAsignacionId(Integer asignacionId) {
        this.asignacionId = asignacionId;
    }

    public Date getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(Date fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    public ResponsableArea getAsignadoA() {
        return asignadoA;
    }

    public void setAsignadoA(ResponsableArea asignadoA) {
        this.asignadoA = asignadoA;
    }

    public ResponsableArea getAsignadoPor() {
        return asignadoPor;
    }

    public void setAsignadoPor(ResponsableArea asignadoPor) {
        this.asignadoPor = asignadoPor;
    }

    public Pqrs getPqrsIdpqrs() {
        return pqrsIdpqrs;
    }

    public void setPqrsIdpqrs(Pqrs pqrsIdpqrs) {
        this.pqrsIdpqrs = pqrsIdpqrs;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (asignacionId != null ? asignacionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Asignacion)) {
            return false;
        }
        Asignacion other = (Asignacion) object;
        if ((this.asignacionId == null && other.asignacionId != null) || (this.asignacionId != null && !this.asignacionId.equals(other.asignacionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Asignacion[ asignacionId=" + asignacionId + " ]";
    }

}
