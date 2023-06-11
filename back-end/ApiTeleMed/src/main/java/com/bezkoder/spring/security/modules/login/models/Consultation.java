package com.bezkoder.spring.security.modules.login.models;

import java.util.HashSet;
import java.util.Set;

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
    name = "consultations"
)

public class Consultation
{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank
  @Size(max = 120)
  private String state;

  @Column(nullable = false)
  private String description;

  @Column(nullable = false)
  private String date;

  @ManyToOne
  @JoinColumn(name="id_doctor", nullable=false)
  private Doctor doctor;

  @ManyToOne
  @JoinColumn(name="id_patient", nullable=false)
  private Patient patient;

  @ManyToOne
  @JoinColumn(name="id_interpreter", nullable=false)
  private Interpreter interpreter;

  @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinTable(name = "consultation_exams", joinColumns = @JoinColumn(name = "id_consultation"),inverseJoinColumns = @JoinColumn(name = "id_exams"))
  private Set<Exams> exams = new HashSet<>();

  @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinTable(name = "consultation_medications", joinColumns = @JoinColumn(name = "id_consultation"),inverseJoinColumns = @JoinColumn(name = "id_medication"))
  private Set<Medication> medications = new HashSet<>();

  public Consultation() 
  {
  }

  public Consultation
  (
	    String state, String description, String date, 
      Doctor doctor, Patient patient, Interpreter interpreter, 
      Set<Medication> medications, Set<Exams> exams
  ) 
  {
	    this.state = state;
      this.description = description;
      this.date = date;
      this.doctor = doctor;
      this.patient = patient;
      this.interpreter = interpreter;
      this.medications = medications;
      this.exams = exams;
  }

 

}
