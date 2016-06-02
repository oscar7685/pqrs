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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nelson
 */
@Entity
@Table(name = "dias_no_habiles", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DiasNoHabiles.findAll", query = "SELECT d FROM DiasNoHabiles d"),
    @NamedQuery(name = "DiasNoHabiles.findByIddiasNoHabiles", query = "SELECT d FROM DiasNoHabiles d WHERE d.iddiasNoHabiles = :iddiasNoHabiles"),
    @NamedQuery(name = "DiasNoHabiles.findByDias", query = "SELECT d FROM DiasNoHabiles d WHERE d.dias = :dias")})
public class DiasNoHabiles implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddias_no_habiles")
    private Integer iddiasNoHabiles;
    @Column(name = "dias")
    @Temporal(TemporalType.DATE)
    private Date dias;

    public DiasNoHabiles() {
    }

    public DiasNoHabiles(Integer iddiasNoHabiles) {
        this.iddiasNoHabiles = iddiasNoHabiles;
    }

    public Integer getIddiasNoHabiles() {
        return iddiasNoHabiles;
    }

    public void setIddiasNoHabiles(Integer iddiasNoHabiles) {
        this.iddiasNoHabiles = iddiasNoHabiles;
    }

    public Date getDias() {
        return dias;
    }

    public void setDias(Date dias) {
        this.dias = dias;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddiasNoHabiles != null ? iddiasNoHabiles.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DiasNoHabiles)) {
            return false;
        }
        DiasNoHabiles other = (DiasNoHabiles) object;
        if ((this.iddiasNoHabiles == null && other.iddiasNoHabiles != null) || (this.iddiasNoHabiles != null && !this.iddiasNoHabiles.equals(other.iddiasNoHabiles))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.DiasNoHabiles[ iddiasNoHabiles=" + iddiasNoHabiles + " ]";
    }
    
}
