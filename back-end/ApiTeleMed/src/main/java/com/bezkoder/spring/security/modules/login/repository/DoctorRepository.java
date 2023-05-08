package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.Doctor;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, UUID> 
{

    Optional<Doctor> findByCrm(String crm);
    Optional<Doctor> findById(long id);
 
}
