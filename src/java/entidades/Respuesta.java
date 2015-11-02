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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "respuesta", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Respuesta.findAll", query = "SELECT r FROM Respuesta r"),
    @NamedQuery(name = "Respuesta.findByIdrespuesta", query = "SELECT r FROM Respuesta r WHERE r.idrespuesta = :idrespuesta"),
    @NamedQuery(name = "Respuesta.findByFechaRespuesta", query = "SELECT r FROM Respuesta r WHERE r.fechaRespuesta = :fechaRespuesta")})
public class Respuesta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrespuesta")
    private Integer idrespuesta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_respuesta")
    @Temporal(TemporalType.DATE)
    private Date fechaRespuesta;
    @JoinColumn(name = "responsable_area_idresponsable_area", referencedColumnName = "idresponsable_area")
    @ManyToOne(optional = false)
    private ResponsableArea responsableAreaIdresponsableArea;
    @JoinColumn(name = "pqrs_idpqrs", referencedColumnName = "idpqrs")
    @ManyToOne(optional = false)
    private Pqrs pqrsIdpqrs;

    public Respuesta() {
    }

    public Respuesta(Integer idrespuesta) {
        this.idrespuesta = idrespuesta;
    }

    public Respuesta(Integer idrespuesta, Date fechaRespuesta) {
        this.idrespuesta = idrespuesta;
        this.fechaRespuesta = fechaRespuesta;
    }

    public Integer getIdrespuesta() {
        return idrespuesta;
    }

    public void setIdrespuesta(Integer idrespuesta) {
        this.idrespuesta = idrespuesta;
    }

    public Date getFechaRespuesta() {
        return fechaRespuesta;
    }

    public void setFechaRespuesta(Date fechaRespuesta) {
        this.fechaRespuesta = fechaRespuesta;
    }

    public ResponsableArea getResponsableAreaIdresponsableArea() {
        return responsableAreaIdresponsableArea;
    }

    public void setResponsableAreaIdresponsableArea(ResponsableArea responsableAreaIdresponsableArea) {
        this.responsableAreaIdresponsableArea = responsableAreaIdresponsableArea;
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
        hash += (idrespuesta != null ? idrespuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respuesta)) {
            return false;
        }
        Respuesta other = (Respuesta) object;
        if ((this.idrespuesta == null && other.idrespuesta != null) || (this.idrespuesta != null && !this.idrespuesta.equals(other.idrespuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Respuesta[ idrespuesta=" + idrespuesta + " ]";
    }
    
}
