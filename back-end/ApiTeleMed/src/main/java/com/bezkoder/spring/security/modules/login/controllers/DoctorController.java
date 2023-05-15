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
      
        Optional<User> user = userService.findById( doctorDTO.getUser().getId() );

        if (!user.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }
       
        var doctorEntities = new Doctor();
        BeanUtils.copyProperties( doctorDTO, doctorEntities);  
  
        doctorService.save( doctorEntities );
        
        User userEntities = new User( user.get().getName(), user.get().getEmail(), user.get().getPassword());
  
        doctorDTO.setUser( userEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( doctorDTO );
    }   
  

    
}
