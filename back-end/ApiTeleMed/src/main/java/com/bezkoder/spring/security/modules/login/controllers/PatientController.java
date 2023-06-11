package com.bezkoder.spring.security.modules.login.controllers;

import java.util.List;
import java.util.Optional;


import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.spring.security.modules.login.services.PatientService;
import com.bezkoder.spring.security.modules.login.services.UserService;
import com.bezkoder.spring.security.modules.login.models.Patient;
import com.bezkoder.spring.security.modules.login.models.User;
import com.bezkoder.spring.security.modules.login.payload.PatientDTO;



@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/patient")
public class PatientController 
{
    @Autowired
    PatientService patientService;

    @Autowired
    UserService userService;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<List<Patient>> getAll(@PageableDefault(page = 0, size = 10, sort = "id") Pageable pageable)
    {
        return ResponseEntity.status(HttpStatus.OK).body( patientService.findAll() );
    }

    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> delet(@PathVariable(value = "id") long id)
    {
        Optional<Patient> Patient = patientService.findById( id );
        
        if (!Patient.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Patient not found.");
        }

        patientService.delete(Patient.get());

        return ResponseEntity.status(HttpStatus.OK).body("Patient deleted successfully.");
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> getById(@PathVariable(value = "id") long id)
    {
        Optional<Patient> Patient = patientService.findById( id );
        
        if (!Patient.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Patient not found.");
        }
        
        return ResponseEntity.status(HttpStatus.OK).body(Patient.get());
    }

    @PostMapping("add")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> save(@Valid @RequestBody PatientDTO PatientDTO)
    {
        
        Optional<User> user = userService.findById( PatientDTO.getUser().getId() );
        Optional<Patient> Patient = patientService.findByCpf( PatientDTO.getcpf() );

        if (!user.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }

        if( Patient.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf exists.");
        }

        if( !PatientDTO.getcpf().matches("\\d{11}") )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf invalid.");
        }

        var patientEntities = new Patient();
        BeanUtils.copyProperties( PatientDTO, patientEntities);  
  
        User userEntities = new User( user.get().getId(), user.get().getName(), user.get().getEmail(), user.get().getPassword(), user.get().getRoles() );
  
        patientEntities.setUser( userEntities );

        patientService.save( patientEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( patientEntities );
    }   

    @PutMapping("{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('PATIENT')")
    public ResponseEntity<Object> update(@PathVariable(value = "cpf") String cpf, @RequestBody @Valid PatientDTO PatientDTO)
    {
        Optional<Patient> patientObj = patientService.findByCpf( cpf );
        Optional<Patient> patient = patientService.findByCpf( PatientDTO.getcpf() );

        if (!patientObj.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }

        if( patient.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf exists.");
        }

        if( !PatientDTO.getcpf().matches("\\d{11}") )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf invalid.");
        }

        var patientEntities = new Patient();
        BeanUtils.copyProperties( PatientDTO, patientEntities);   
        patientEntities.setId( patient.get().getId() );
    
        return ResponseEntity.status(HttpStatus.OK).body( patientService.save( patientEntities )  );
    }
  

    
}
