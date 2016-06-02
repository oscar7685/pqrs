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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nelson
 */
@Entity
@Table(name = "proceso", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proceso.findAll", query = "SELECT p FROM Proceso p"),
    @NamedQuery(name = "Proceso.findByIdproceso", query = "SELECT p FROM Proceso p WHERE p.idproceso = :idproceso"),
    @NamedQuery(name = "Proceso.findByProceso", query = "SELECT p FROM Proceso p WHERE p.proceso = :proceso")})
public class Proceso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idproceso")
    private Integer idproceso;
    @Size(max = 500)
    @Column(name = "proceso")
    private String proceso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoIdproceso")
    private List<Subproceso> subprocesoList;

    public Proceso() {
    }

    public Proceso(Integer idproceso) {
        this.idproceso = idproceso;
    }

    public Integer getIdproceso() {
        return idproceso;
    }

    public void setIdproceso(Integer idproceso) {
        this.idproceso = idproceso;
    }

    public String getProceso() {
        return proceso;
    }

    public void setProceso(String proceso) {
        this.proceso = proceso;
    }

    @XmlTransient
    public List<Subproceso> getSubprocesoList() {
        return subprocesoList;
    }

    public void setSubprocesoList(List<Subproceso> subprocesoList) {
        this.subprocesoList = subprocesoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproceso != null ? idproceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proceso)) {
            return false;
        }
        Proceso other = (Proceso) object;
        if ((this.idproceso == null && other.idproceso != null) || (this.idproceso != null && !this.idproceso.equals(other.idproceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Proceso[ idproceso=" + idproceso + " ]";
    }
    
}
