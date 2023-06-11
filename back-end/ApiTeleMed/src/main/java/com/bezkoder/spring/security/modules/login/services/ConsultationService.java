package com.bezkoder.spring.security.modules.login.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Consultation;
import com.bezkoder.spring.security.modules.login.repository.ConsultationRepository;

import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ConsultationService 
{
    @Autowired
    ConsultationRepository consultationRepository;
    
    @Transactional
    public Consultation save(Consultation Consultation) 
    {
        return consultationRepository.save(Consultation);
    }

    public Optional<Consultation> findById(long id) 
    {
        return consultationRepository.findById(id);
    }

    @Transactional
    public void delete(Consultation consultationModel) 
    {
        consultationRepository.delete(consultationModel);
    }

    public List<Consultation> findAll()
    {
        return consultationRepository.findAll();
    }


}
