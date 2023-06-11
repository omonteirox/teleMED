package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.Interpreter;

@Repository
public interface InterpreterRepository extends JpaRepository<Interpreter, UUID> 
{

    Optional<Interpreter> findByCpf(String cpf);
    Optional<Interpreter> findById(long id);
 
}
