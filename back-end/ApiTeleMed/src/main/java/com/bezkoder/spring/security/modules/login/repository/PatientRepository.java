package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.Patient;


@Repository
public interface PatientRepository extends JpaRepository<Patient, UUID> 
{

    Optional<Patient> findByCpf(String cpf);
    Optional<Patient> findById(long id);
 
}
