package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.Consultation;

@Repository
public interface ConsultationRepository extends JpaRepository<Consultation, UUID> 
{
    Optional<Consultation> findById(long id); 
    Optional<Consultation> findByState(String state);
}
