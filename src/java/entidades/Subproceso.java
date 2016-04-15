/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author acreditacion
 */
@Entity
@Table(name = "subproceso", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subproceso.findAll", query = "SELECT s FROM Subproceso s"),
    @NamedQuery(name = "Subproceso.findByIdsubproceso", query = "SELECT s FROM Subproceso s WHERE s.idsubproceso = :idsubproceso"),
    @NamedQuery(name = "Subproceso.findBySubproceso", query = "SELECT s FROM Subproceso s WHERE s.subproceso = :subproceso")})
public class Subproceso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idsubproceso")
    private Integer idsubproceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "subproceso")
    private String subproceso;
    @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")
    @ManyToOne(optional = false)
    private Proceso procesoIdproceso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subprocesoIdsubproceso")
    private List<Respuesta> respuestaList;

    public Subproceso() {
    }

    public Subproceso(Integer idsubproceso) {
        this.idsubproceso = idsubproceso;
    }

    public Subproceso(Integer idsubproceso, String subproceso) {
        this.idsubproceso = idsubproceso;
        this.subproceso = subproceso;
    }

    public Integer getIdsubproceso() {
        return idsubproceso;
    }

    public void setIdsubproceso(Integer idsubproceso) {
        this.idsubproceso = idsubproceso;
    }

    public String getSubproceso() {
        return subproceso;
    }

    public void setSubproceso(String subproceso) {
        this.subproceso = subproceso;
    }

    public Proceso getProcesoIdproceso() {
        return procesoIdproceso;
    }

    public void setProcesoIdproceso(Proceso procesoIdproceso) {
        this.procesoIdproceso = procesoIdproceso;
    }

    @XmlTransient
    public List<Respuesta> getRespuestaList() {
        return respuestaList;
    }

    public void setRespuestaList(List<Respuesta> respuestaList) {
        this.respuestaList = respuestaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsubproceso != null ? idsubproceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Subproceso)) {
            return false;
        }
        Subproceso other = (Subproceso) object;
        if ((this.idsubproceso == null && other.idsubproceso != null) || (this.idsubproceso != null && !this.idsubproceso.equals(other.idsubproceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Subproceso[ idsubproceso=" + idsubproceso + " ]";
    }
    
}
