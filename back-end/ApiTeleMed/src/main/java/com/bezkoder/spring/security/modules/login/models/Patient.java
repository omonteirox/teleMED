package com.bezkoder.spring.security.modules.login.models;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table
(
    name = "patients",
    uniqueConstraints = 
    {
       @UniqueConstraint(columnNames = "cpf")
    }
)

public class Patient
{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank
  @Size(max = 120)
  private String name;

  @NotBlank
  @Size(max = 120)
  private String cpf;

  @ManyToOne
  @JoinColumn(name="id_user", nullable=false)
  private User user;


  public Patient() 
  {
  }

  public Patient
  (
		Long id, String name, String cpf, User user
  ) 
  {
    this.id = id;
	  this.name = name;
    this.cpf = cpf;
    this.user = user;
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

  public String getCpf() {
    return cpf;
  }

  public void setCpf(String cpf) {
    this.cpf = cpf;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

}
