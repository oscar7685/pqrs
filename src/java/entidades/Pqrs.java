/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "pqrs", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pqrs.findAll", query = "SELECT p FROM Pqrs p"),
    @NamedQuery(name = "Pqrs.findByIdpqrs", query = "SELECT p FROM Pqrs p WHERE p.idpqrs = :idpqrs"),
    @NamedQuery(name = "Pqrs.findByTipo", query = "SELECT p FROM Pqrs p WHERE p.tipo = :tipo"),
    @NamedQuery(name = "Pqrs.findByNotificarMail", query = "SELECT p FROM Pqrs p WHERE p.notificarMail = :notificarMail"),
    @NamedQuery(name = "Pqrs.findByDescripcion", query = "SELECT p FROM Pqrs p WHERE p.descripcion = :descripcion"),
    @NamedQuery(name = "Pqrs.findByAdjunto", query = "SELECT p FROM Pqrs p WHERE p.adjunto = :adjunto"),
    @NamedQuery(name = "Pqrs.findByFechaCreacion", query = "SELECT p FROM Pqrs p WHERE p.fechaCreacion = :fechaCreacion"),
    @NamedQuery(name = "Pqrs.findByEstado", query = "SELECT p FROM Pqrs p WHERE p.estado = :estado"),
    @NamedQuery(name = "Pqrs.findByMedioIngreso", query = "SELECT p FROM Pqrs p WHERE p.medioIngreso = :medioIngreso"),
    @NamedQuery(name = "Pqrs.findByEstadoSolicitud", query = "SELECT p FROM Pqrs p WHERE p.estadoSolicitud = :estadoSolicitud")})
public class Pqrs implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpqrs")
    private Integer idpqrs;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipo")
    private String tipo;
    @Size(max = 45)
    @Column(name = "notificar_mail")
    private String notificarMail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5000)
    @Column(name = "descripcion")
    private String descripcion;
    @Size(max = 2000)
    @Column(name = "adjunto")
    private String adjunto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estado")
    private String estado;
    @Size(max = 45)
    @Column(name = "medio_ingreso")
    private String medioIngreso;
    @Size(max = 100)
    @Column(name = "estadoSolicitud")
    private String estadoSolicitud;
    @JoinColumn(name = "reclamante_idreclamante", referencedColumnName = "idreclamante")
    @ManyToOne(optional = false)
    private Reclamante reclamanteIdreclamante;
    @JoinColumn(name = "area_idarea", referencedColumnName = "idarea")
    @ManyToOne(optional = false)
    private Area areaIdarea;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pqrsIdpqrs")
    private List<Respuesta> respuestaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pqrsIdpqrs")
    private List<Asignacion> asignacionList;

    public Pqrs() {
    }

    public Pqrs(Integer idpqrs) {
        this.idpqrs = idpqrs;
    }

    public Pqrs(Integer idpqrs, String tipo, String descripcion, Date fechaCreacion, String estado) {
        this.idpqrs = idpqrs;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.fechaCreacion = fechaCreacion;
        this.estado = estado;
    }

    public Integer getIdpqrs() {
        return idpqrs;
    }

    public void setIdpqrs(Integer idpqrs) {
        this.idpqrs = idpqrs;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNotificarMail() {
        return notificarMail;
    }

    public void setNotificarMail(String notificarMail) {
        this.notificarMail = notificarMail;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMedioIngreso() {
        return medioIngreso;
    }

    public void setMedioIngreso(String medioIngreso) {
        this.medioIngreso = medioIngreso;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public Reclamante getReclamanteIdreclamante() {
        return reclamanteIdreclamante;
    }

    public void setReclamanteIdreclamante(Reclamante reclamanteIdreclamante) {
        this.reclamanteIdreclamante = reclamanteIdreclamante;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpqrs != null ? idpqrs.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pqrs)) {
            return false;
        }
        Pqrs other = (Pqrs) object;
        if ((this.idpqrs == null && other.idpqrs != null) || (this.idpqrs != null && !this.idpqrs.equals(other.idpqrs))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Pqrs[ idpqrs=" + idpqrs + " ]";
    }
    
}
