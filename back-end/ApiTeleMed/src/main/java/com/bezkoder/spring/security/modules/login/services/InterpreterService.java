package com.bezkoder.spring.security.modules.login.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Interpreter;
import com.bezkoder.spring.security.modules.login.repository.InterpreterRepository;

import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class InterpreterService 
{
    @Autowired
    InterpreterRepository interpreterRepository;
    
    @Transactional
    public Interpreter save(Interpreter Interpreter) 
    {
        return interpreterRepository.save(Interpreter);
    }

    public Optional<Interpreter> findById(long id) 
    {
        return interpreterRepository.findById(id);
    }

    @Transactional
    public void delete(Interpreter InterpreterModel) 
    {
        interpreterRepository.delete(InterpreterModel);
    }

    public List<Interpreter> findAll()
    {
        return interpreterRepository.findAll();
    }

    public Optional<Interpreter> findByCpf( String cpf ) 
    {
       return interpreterRepository.findByCpf(cpf);
    }

   


}
