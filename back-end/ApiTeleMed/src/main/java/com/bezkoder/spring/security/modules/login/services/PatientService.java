package com.bezkoder.spring.security.modules.login.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Patient;
import com.bezkoder.spring.security.modules.login.repository.PatientRepository;

import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class PatientService 
{
    @Autowired
    PatientRepository patientRepository;
    
    @Transactional
    public Patient save(Patient Patient) 
    {
        return patientRepository.save(Patient);
    }

    public Optional<Patient> findById(long id) 
    {
        return patientRepository.findById(id);
    }

    @Transactional
    public void delete(Patient PatientModel) 
    {
        patientRepository.delete(PatientModel);
    }

    public List<Patient> findAll()
    {
        return patientRepository.findAll();
    }

    public Optional<Patient> findByCpf( String cpf ) 
    {
       return patientRepository.findByCpf(cpf);
    }


}
