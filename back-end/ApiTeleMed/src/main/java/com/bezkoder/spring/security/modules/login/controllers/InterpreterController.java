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

import com.bezkoder.spring.security.modules.login.services.InterpreterService;
import com.bezkoder.spring.security.modules.login.services.UserService;
import com.bezkoder.spring.security.modules.login.models.Interpreter;
import com.bezkoder.spring.security.modules.login.models.User;
import com.bezkoder.spring.security.modules.login.payload.InterpreterDTO;




@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/interpreter")
public class InterpreterController 
{
    @Autowired
    InterpreterService interpreterService;

    @Autowired
    UserService userService;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<List<Interpreter>> getAll(@PageableDefault(page = 0, size = 10, sort = "id") Pageable pageable)
    {
        return ResponseEntity.status(HttpStatus.OK).body( interpreterService.findAll() );
    }

    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> delet(@PathVariable(value = "id") long id)
    {
        Optional<Interpreter> Interpreter = interpreterService.findById( id );
        
        if (!Interpreter.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Interpreter not found.");
        }

        interpreterService.delete(Interpreter.get());

        return ResponseEntity.status(HttpStatus.OK).body("Interpreter deleted successfully.");
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> getById(@PathVariable(value = "id") long id)
    {
        Optional<Interpreter> Interpreter = interpreterService.findById( id );
        
        if (!Interpreter.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Interpreter not found.");
        }
        
        return ResponseEntity.status(HttpStatus.OK).body(Interpreter.get());
    }

    @PostMapping("add")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> save(@Valid @RequestBody InterpreterDTO InterpreterDTO)
    {
        
        Optional<User> user = userService.findById( InterpreterDTO.getUser().getId() );
        Optional<Interpreter> Interpreter = interpreterService.findByCpf( InterpreterDTO.getcpf() );

        if (!user.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }

        if( Interpreter.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf exists.");
        }

        if( !InterpreterDTO.getcpf().matches("\\d{11}") )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf invalid.");
        }

        var interpreterEntities = new Interpreter();
        BeanUtils.copyProperties( InterpreterDTO, interpreterEntities);  
  
        User userEntities = new User( user.get().getId(), user.get().getName(), user.get().getEmail(), user.get().getPassword(), user.get().getRoles() );
  
        interpreterEntities.setUser( userEntities );

        interpreterService.save( interpreterEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( interpreterEntities );
    }   

    @PutMapping("{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('INTERPRETER')")
    public ResponseEntity<Object> update(@PathVariable(value = "cpf") String cpf, @RequestBody @Valid InterpreterDTO InterpreterDTO)
    {
        Optional<Interpreter> interpreterObj = interpreterService.findByCpf( cpf );
        Optional<Interpreter> interpreter = interpreterService.findByCpf( InterpreterDTO.getcpf() );

        if (!interpreterObj.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
        }

        if( interpreter.isPresent() )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf exists.");
        }

        if( !InterpreterDTO.getcpf().matches("\\d{11}") )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("cpf invalid.");
        }

        var InterpreterEntities = new Interpreter();
        BeanUtils.copyProperties( InterpreterDTO, InterpreterEntities);   
        InterpreterEntities.setId( interpreter.get().getId() );
    
        return ResponseEntity.status(HttpStatus.OK).body( interpreterService.save( InterpreterEntities )  );
    }
  

    
}
