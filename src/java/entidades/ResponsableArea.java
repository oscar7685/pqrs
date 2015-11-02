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
 * @author Oscar
 */
@Entity
@Table(name = "responsable_area", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ResponsableArea.findAll", query = "SELECT r FROM ResponsableArea r"),
    @NamedQuery(name = "ResponsableArea.findByIdresponsableArea", query = "SELECT r FROM ResponsableArea r WHERE r.idresponsableArea = :idresponsableArea"),
    @NamedQuery(name = "ResponsableArea.findByNombre", query = "SELECT r FROM ResponsableArea r WHERE r.nombre = :nombre"),
    @NamedQuery(name = "ResponsableArea.findByApellido", query = "SELECT r FROM ResponsableArea r WHERE r.apellido = :apellido"),
    @NamedQuery(name = "ResponsableArea.findByEmail", query = "SELECT r FROM ResponsableArea r WHERE r.email = :email"),
    @NamedQuery(name = "ResponsableArea.findByCelular", query = "SELECT r FROM ResponsableArea r WHERE r.celular = :celular"),
    @NamedQuery(name = "ResponsableArea.findByTelefono", query = "SELECT r FROM ResponsableArea r WHERE r.telefono = :telefono"),
    @NamedQuery(name = "ResponsableArea.findByPassword", query = "SELECT r FROM ResponsableArea r WHERE r.password = :password")})
public class ResponsableArea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idresponsable_area")
    private Integer idresponsableArea;
    @Size(max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 45)
    @Column(name = "apellido")
    private String apellido;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email")
    private String email;
    @Size(max = 45)
    @Column(name = "celular")
    private String celular;
    @Size(max = 45)
    @Column(name = "telefono")
    private String telefono;
    @Size(max = 45)
    @Column(name = "password")
    private String password;
    @JoinColumn(name = "area_idarea", referencedColumnName = "idarea")
    @ManyToOne(optional = false)
    private Area areaIdarea;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "responsableAreaIdresponsableArea")
    private List<Respuesta> respuestaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "asignadoA")
    private List<Asignacion> asignacionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "asignadoPor")
    private List<Asignacion> asignacionList1;

    public ResponsableArea() {
    }

    public ResponsableArea(Integer idresponsableArea) {
        this.idresponsableArea = idresponsableArea;
    }

    public Integer getIdresponsableArea() {
        return idresponsableArea;
    }

    public void setIdresponsableArea(Integer idresponsableArea) {
        this.idresponsableArea = idresponsableArea;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Area getAreaIdarea() {
        return areaIdarea;
    }

    public void setAreaIdarea(Area areaIdarea) {
        this.areaIdarea = areaIdarea;
    }

    @XmlTransient
    public List<Respuesta> getRespuestaList() {
        return respuestaList;
    }

    public void setRespuestaList(List<Respuesta> respuestaList) {
        this.respuestaList = respuestaList;
    }

    @XmlTransient
    public List<Asignacion> getAsignacionList() {
        return asignacionList;
    }

    public void setAsignacionList(List<Asignacion> asignacionList) {
        this.asignacionList = asignacionList;
    }

    @XmlTransient
    public List<Asignacion> getAsignacionList1() {
        return asignacionList1;
    }

    public void setAsignacionList1(List<Asignacion> asignacionList1) {
        this.asignacionList1 = asignacionList1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idresponsableArea != null ? idresponsableArea.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ResponsableArea)) {
            return false;
        }
        ResponsableArea other = (ResponsableArea) object;
        if ((this.idresponsableArea == null && other.idresponsableArea != null) || (this.idresponsableArea != null && !this.idresponsableArea.equals(other.idresponsableArea))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.ResponsableArea[ idresponsableArea=" + idresponsableArea + " ]";
    }
    
}
