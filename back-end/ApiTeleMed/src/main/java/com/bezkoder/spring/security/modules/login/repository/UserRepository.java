package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> 
{
  Optional<User> findByUsername(String username);
  Boolean existsByUsername(String username);
  Boolean existsByEmail(String email);
  Optional<User> findById(long id);
}
