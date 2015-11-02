/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "mail", catalog = "pqrs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mail.findAll", query = "SELECT m FROM Mail m"),
    @NamedQuery(name = "Mail.findByIdmail", query = "SELECT m FROM Mail m WHERE m.idmail = :idmail"),
    @NamedQuery(name = "Mail.findByUsernameSistema", query = "SELECT m FROM Mail m WHERE m.usernameSistema = :usernameSistema"),
    @NamedQuery(name = "Mail.findByPasswordSistema", query = "SELECT m FROM Mail m WHERE m.passwordSistema = :passwordSistema"),
    @NamedQuery(name = "Mail.findByUsernameAdministrador", query = "SELECT m FROM Mail m WHERE m.usernameAdministrador = :usernameAdministrador")})
public class Mail implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmail")
    private Integer idmail;
    @Size(max = 100)
    @Column(name = "username_sistema")
    private String usernameSistema;
    @Size(max = 100)
    @Column(name = "password_sistema")
    private String passwordSistema;
    @Size(max = 100)
    @Column(name = "username_administrador")
    private String usernameAdministrador;

    public Mail() {
    }

    public Mail(Integer idmail) {
        this.idmail = idmail;
    }

    public Integer getIdmail() {
        return idmail;
    }

    public void setIdmail(Integer idmail) {
        this.idmail = idmail;
    }

    public String getUsernameSistema() {
        return usernameSistema;
    }

    public void setUsernameSistema(String usernameSistema) {
        this.usernameSistema = usernameSistema;
    }

    public String getPasswordSistema() {
        return passwordSistema;
    }

    public void setPasswordSistema(String passwordSistema) {
        this.passwordSistema = passwordSistema;
    }

    public String getUsernameAdministrador() {
        return usernameAdministrador;
    }

    public void setUsernameAdministrador(String usernameAdministrador) {
        this.usernameAdministrador = usernameAdministrador;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmail != null ? idmail.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mail)) {
            return false;
        }
        Mail other = (Mail) object;
        if ((this.idmail == null && other.idmail != null) || (this.idmail != null && !this.idmail.equals(other.idmail))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Mail[ idmail=" + idmail + " ]";
    }
    
}
