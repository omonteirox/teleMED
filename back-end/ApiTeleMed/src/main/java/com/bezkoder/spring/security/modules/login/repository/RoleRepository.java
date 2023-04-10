package com.bezkoder.spring.security.modules.login.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.spring.security.modules.login.models.ERole;
import com.bezkoder.spring.security.modules.login.models.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> 
{
  Optional<Role> findByName(ERole name);
}
