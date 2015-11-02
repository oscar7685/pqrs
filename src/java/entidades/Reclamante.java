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
import javax.persistence.Id;
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
 * @author Oscar
 */
@Entity
@Table(name = "reclamante", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reclamante.findAll", query = "SELECT r FROM Reclamante r"),
    @NamedQuery(name = "Reclamante.findByIdreclamante", query = "SELECT r FROM Reclamante r WHERE r.idreclamante = :idreclamante"),
    @NamedQuery(name = "Reclamante.findByNombre", query = "SELECT r FROM Reclamante r WHERE r.nombre = :nombre"),
    @NamedQuery(name = "Reclamante.findByApellido", query = "SELECT r FROM Reclamante r WHERE r.apellido = :apellido"),
    @NamedQuery(name = "Reclamante.findByCelular", query = "SELECT r FROM Reclamante r WHERE r.celular = :celular"),
    @NamedQuery(name = "Reclamante.findByEmail", query = "SELECT r FROM Reclamante r WHERE r.email = :email"),
    @NamedQuery(name = "Reclamante.findByPassword", query = "SELECT r FROM Reclamante r WHERE r.password = :password"),
    @NamedQuery(name = "Reclamante.findByTipo", query = "SELECT r FROM Reclamante r WHERE r.tipo = :tipo")})
public class Reclamante implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idreclamante")
    private Integer idreclamante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "apellido")
    private String apellido;
    @Size(max = 45)
    @Column(name = "celular")
    private String celular;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "tipo")
    private String tipo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reclamanteIdreclamante")
    private List<Pqrs> pqrsList;

    public Reclamante() {
    }

    public Reclamante(Integer idreclamante) {
        this.idreclamante = idreclamante;
    }

    public Reclamante(Integer idreclamante, String nombre, String apellido, String password, String tipo) {
        this.idreclamante = idreclamante;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        this.tipo = tipo;
    }

    public Integer getIdreclamante() {
        return idreclamante;
    }

    public void setIdreclamante(Integer idreclamante) {
        this.idreclamante = idreclamante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public List<Pqrs> getPqrsList() {
        return pqrsList;
    }

    public void setPqrsList(List<Pqrs> pqrsList) {
        this.pqrsList = pqrsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idreclamante != null ? idreclamante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reclamante)) {
            return false;
        }
        Reclamante other = (Reclamante) object;
        if ((this.idreclamante == null && other.idreclamante != null) || (this.idreclamante != null && !this.idreclamante.equals(other.idreclamante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Reclamante[ idreclamante=" + idreclamante + " ]";
    }
    
}
