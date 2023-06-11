package com.bezkoder.spring.security.modules.login.payload;

import javax.validation.constraints.NotBlank;


public class ExamsDTO 
{
  @NotBlank
  private String name;


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
