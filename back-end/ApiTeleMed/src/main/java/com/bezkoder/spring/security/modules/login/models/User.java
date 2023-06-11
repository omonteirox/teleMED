package com.bezkoder.spring.security.modules.login.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.lang.Nullable;

@Entity
@Table
(
    name = "users",
    uniqueConstraints = 
    {
       @UniqueConstraint(columnNames = "email")
    }
)

public class User 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;


  @NotBlank
  @Size(max = 120)
  private String name;

  @Nullable
  private String username;

  @NotBlank
  @Size(max = 50)
  @Email
  private String email;

  @NotBlank
  @Size(max = 120)
  private String password;


  @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"),inverseJoinColumns = @JoinColumn(name = "role_id"))
  private Set<Role> roles = new HashSet<>();

  
  @OneToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "user_imagen", joinColumns = @JoinColumn(name = "user_id"),inverseJoinColumns = @JoinColumn(name = "img_id"))
  private Set<Images> imagens = new HashSet<>();

  public User() 
  {
  }

  public User
  (
		String name, String email, String password
  ) 
  {
	  this.name = name;
    this.email = email;
    this.password = password;
    this.username = email;
  }

  public User
  (
		String name, String email, String password, Set<Images> imagens
  ) 
  {
	  this.name = name;
    this.email = email;
    this.password = password;
    this.imagens = imagens;
    this.username = email;
  }

  public User
  (
    Long id, String name, String email, String password, Set<Role> roles
  ) 
  {
    this.id = id;
    this.name = name;
    this.email = email;
    this.password = password;
    this.username = email;
    this.roles = roles;
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

  public String getUsername() {
    return username;
  }

  public void setUsername(String email) {
    this.username = email;
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

  public Set<Role> getRoles() {
    return roles;
  }

  public void setRoles(Set<Role> roles) {
    this.roles = roles;
  }

  public Set<Images> getImagens() {
      return imagens;
  }

  public void setImagens(Set<Images> imagens) {
    this.imagens = imagens;
  }


}
