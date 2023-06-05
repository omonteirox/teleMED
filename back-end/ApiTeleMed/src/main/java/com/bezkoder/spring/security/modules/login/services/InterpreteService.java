package com.bezkoder.spring.security.modules.login.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bezkoder.spring.security.modules.login.models.Interprete;
import com.bezkoder.spring.security.modules.login.repository.InterpreteRepository;

@Service
public class InterpreteService {

	@Autowired
	private InterpreteRepository repository;

	public Interprete save(Interprete interprete) {
		return repository.save(interprete);
	}

	public Optional<Interprete> findById(long id) {
		return repository.findById(id);
	}

	@Transactional
	public void delete(Interprete interprete) {
		repository.delete(interprete);
	}

	public List<Interprete> findAll() {
		return repository.findAll();
	}
}
