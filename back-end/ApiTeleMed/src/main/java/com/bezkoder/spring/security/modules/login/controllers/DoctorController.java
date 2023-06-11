package com.bezkoder.spring.security.modules.login.controllers;

import java.util.Arrays;
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

import com.bezkoder.spring.security.modules.login.services.DoctorService;
import com.bezkoder.spring.security.modules.login.services.UserService;
import com.bezkoder.spring.security.modules.login.models.Doctor;
import com.bezkoder.spring.security.modules.login.models.User;
import com.bezkoder.spring.security.modules.login.payload.DoctorDTO;



@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/doctor")
public class DoctorController 
{
    @Autowired
    DoctorService doctorService;

    @Autowired
    UserService userService;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<List<Doctor>> getAll(@PageableDefault(page = 0, size = 10, sort = "id") Pageable pageable)
    {
        return ResponseEntity.status(HttpStatus.OK).body( doctorService.findAll() );
    }

    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> delet(@PathVariable(value = "id") long id)
    {
        Optional<Doctor> doctor = doctorService.findById( id );
        
        if (!doctor.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("doctor not found.");
        }

        doctorService.delete(doctor.get());

        return ResponseEntity.status(HttpStatus.OK).body("doctor deleted successfully.");
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> getById(@PathVariable(value = "id") long id)
    {
        Optional<Doctor> doctor = doctorService.findById( id );
        
        if (!doctor.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("doctor not found.");
        }
        
        return ResponseEntity.status(HttpStatus.OK).body(doctor.get());
    }

    @PostMapping("add")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> save(@Valid @RequestBody DoctorDTO doctorDTO)
    {
      
        String[] specialt = {"Clínico Geral", "Pediatria", "Ginecologia", "Ortopedia", "Dermatologia"};
        
        Optional<User> user = userService.findById( doctorDTO.getUser().getId() );
        Optional<Doctor> doctor = doctorService.findByCrm( doctorDTO.getCrm() );

        if (!user.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }

        if( !Arrays.asList( specialt ).contains( doctorDTO.getSpecialty() )  )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("specialt not found. Especialidades validas [ Clínico Geral,Pediatria,Ginecologia,Ortopedia e Dermatologia ]");
        }

        if( doctor.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("crm exists.");
        }

        var doctorEntities = new Doctor();
        BeanUtils.copyProperties( doctorDTO, doctorEntities);  
  
        User userEntities = new User( user.get().getId(), user.get().getName(), user.get().getEmail(), user.get().getPassword(), user.get().getRoles() );
  
        doctorEntities.setUser( userEntities );

        doctorService.save( doctorEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( doctorEntities );
    }   

    @PutMapping("{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> update(@PathVariable(value = "crm") String crm, @RequestBody @Valid DoctorDTO doctorDTO)
    {
        String[] specialt = {"Clínico Geral", "Pediatria", "Ginecologia", "Ortopedia", "Dermatologia"};
        
        Optional<Doctor> doctorObj = doctorService.findByCrm( crm );
        Optional<Doctor> doctor = doctorService.findByCrm( doctorDTO.getCrm() );

        if ( !doctorObj.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("doctor not found.");
        }

        if( !Arrays.asList( specialt ).contains( doctorDTO.getSpecialty() )  )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("specialt not found. Especialidades validas [ Clínico Geral,Pediatria,Ginecologia,Ortopedia e Dermatologia ]");
        }

        if( doctor.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("crm exists.");
        }

        var doctorEntities = new Doctor();
        BeanUtils.copyProperties( doctorDTO, doctorEntities);  
        doctorEntities.setId( doctor.get().getId() );
    
        return ResponseEntity.status(HttpStatus.OK).body( doctorService.save( doctorEntities )  );
    }
  

    
}
