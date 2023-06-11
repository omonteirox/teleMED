package com.bezkoder.spring.security.modules.login.payload;

import javax.validation.constraints.NotBlank;

import com.bezkoder.spring.security.modules.login.models.User;

public class PatientDTO 
{
  @NotBlank
  private String name;

  @NotBlank
  private String cpf;

  private User User;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getcpf() {
    return cpf;
  }

  public void setcpf(String cpf) {
    this.cpf = cpf;
  }
  
  public User getUser() {
    return User;
  }

  public void setUser(User User) {
    this.User = User;
  }

}
