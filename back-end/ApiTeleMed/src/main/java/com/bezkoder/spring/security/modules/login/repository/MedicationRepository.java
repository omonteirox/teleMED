package com.bezkoder.spring.security.modules.login.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.Medication;


@Repository
public interface MedicationRepository extends JpaRepository<Medication, UUID> 
{
 
}
