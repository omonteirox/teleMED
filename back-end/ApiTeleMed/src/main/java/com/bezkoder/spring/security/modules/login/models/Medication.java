package com.bezkoder.spring.security.modules.login.models;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table
(
    name = "medications",
    uniqueConstraints = 
    {
       @UniqueConstraint(columnNames = "name")
    }
)

public class Medication
{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank
  @Size(max = 120)
  private String name;

  @NotBlank
  @Size(max = 12)
  private String days;

  @NotBlank
  @Size(max = 12)
  private String quantityGrams;

  @NotBlank
  @Size(max = 12)
  private String intervalMedication;

  public Medication() 
  {
  }

  public Medication
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
