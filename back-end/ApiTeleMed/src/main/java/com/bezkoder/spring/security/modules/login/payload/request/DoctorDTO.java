package com.bezkoder.spring.security.modules.login.payload.request;

import javax.validation.constraints.NotBlank;

import com.bezkoder.spring.security.modules.login.models.User;

public class DoctorDTO 
{
@NotBlank
  private String name;

  @NotBlank
  private String specialty;

  @NotBlank
  private String crm;

  private User User;

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

  public User getUser() {
    return User;
  }

  public void setUser(User User) {
    this.User = User;
  }

}
