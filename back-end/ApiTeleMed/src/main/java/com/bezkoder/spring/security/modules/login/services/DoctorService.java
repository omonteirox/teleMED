package com.bezkoder.spring.security.modules.login.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Doctor;
import com.bezkoder.spring.security.modules.login.repository.DoctorRepository;

import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class DoctorService 
{
    @Autowired
    DoctorRepository doctorRepository;
    
    @Transactional
    public Doctor save(Doctor Doctor) 
    {
        return doctorRepository.save(Doctor);
    }

    public Optional<Doctor> findById(long id) 
    {
        return doctorRepository.findById(id);
    }

    public Optional<Doctor> existsByEmail(String crm)
    {
        return doctorRepository.findByCrm(crm);
    }

    @Transactional
    public void delete(Doctor DoctorModel) 
    {
        doctorRepository.delete(DoctorModel);
    }

    public List<Doctor> findAll()
    {
        return doctorRepository.findAll();
    }


}
