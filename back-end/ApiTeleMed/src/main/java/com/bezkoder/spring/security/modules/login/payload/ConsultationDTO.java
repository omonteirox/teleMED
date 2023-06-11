package com.bezkoder.spring.security.modules.login.payload;


import java.util.Set;

import javax.validation.constraints.NotBlank;
import com.bezkoder.spring.security.modules.login.models.Doctor;
import com.bezkoder.spring.security.modules.login.models.Exams;
import com.bezkoder.spring.security.modules.login.models.Interpreter;
import com.bezkoder.spring.security.modules.login.models.Medication;
import com.bezkoder.spring.security.modules.login.models.Patient;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ConsultationDTO 
{
  @NotBlank
  private String state;

  @NotBlank
  private String description;

  @NotBlank
  private String date;

  private Doctor doctor;

  private Patient patient;

  private Interpreter interpreter;

  private Set<Medication> medications;

  private Set<Exams> exams;


   public ConsultationDTO
  (
    String state, String description, String date, Doctor doctor, Patient patient,
    Interpreter interpreter,  Set<Medication> medications, Set<Exams> exams
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
