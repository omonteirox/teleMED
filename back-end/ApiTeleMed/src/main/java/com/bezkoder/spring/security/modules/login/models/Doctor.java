package com.bezkoder.spring.security.modules.login.models;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table
(
    name = "doctors",
    uniqueConstraints = 
    {
       @UniqueConstraint(columnNames = "crm")
    }
)

public class Doctor
{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank
  @Size(max = 120)
  private String name;

  @NotBlank
  @Size(max = 120)
  private String specialty;

  @NotBlank
  @Size(max = 120)
  private String crm;

  @ManyToOne
  @JoinColumn(name="id_user", nullable=false)
  private User idUser;


  public Doctor() 
  {
  }

  public Doctor
  (
		String name, String crm, User idUser, String specialty
  ) 
  {
	this.name = name;
    this.crm = crm;
    this.idUser = idUser;
    this.specialty = specialty;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getCrm() {
    return crm;
  }

  public void setCrm(String crm) {
    this.crm = crm;
  }

  public String getSpecialty() {
    return specialty;
  }

  public void setSpecialty(String specialty) {
    this.specialty = specialty;
  }

  public User getIdUser() {
    return idUser;
  }

  public void setIdUser(User idUser) {
    this.idUser = idUser;
  }

}
