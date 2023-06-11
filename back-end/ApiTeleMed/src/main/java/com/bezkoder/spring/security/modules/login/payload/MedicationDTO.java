package com.bezkoder.spring.security.modules.login.payload;


import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MedicationDTO 
{
  @NotBlank
  private String name;

  @NotBlank
  private String days;

  @NotBlank
  private String quantityGrams;

  @NotBlank
  private String intervalMedication;

  public MedicationDTO
  (
    String name,
    String days,
    String quantityGrams,
    String intervalMedication
  ) 
  {
    this.name = name;
    this.days = days;
    this.quantityGrams = quantityGrams;
    this.intervalMedication = intervalMedication;
  }
  
  

}
