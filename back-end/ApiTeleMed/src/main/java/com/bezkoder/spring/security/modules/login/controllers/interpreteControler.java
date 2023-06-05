package com.bezkoder.spring.security.modules.login.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.spring.security.modules.login.models.Interprete;
import com.bezkoder.spring.security.modules.login.services.InterpreteService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/interprete")
public class interpreteControler {

	@Autowired
	private InterpreteService service;



	@GetMapping
	public ResponseEntity<List<Interprete>> listar(@PageableDefault(page = 0, size = 10, sort = "id") Pageable pageable) {
		return ResponseEntity.status(HttpStatus.OK).body(service.findAll());
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Object> deletar(@PathVariable(value = "id") long id) {
		Optional<Interprete> interprete = service.findById(id);

		if (!interprete.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("interprete not found.");
		}

		service.delete(interprete.get());

		return ResponseEntity.status(HttpStatus.OK).body("uccessfully.");
	}

	@GetMapping("/{id}")
	public ResponseEntity<Object> buscar(@PathVariable(value = "id") long id) {
		Optional<Interprete> interprete = service.findById(id);

		if (!interprete.isPresent()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Interprete not found.");
		}

		return ResponseEntity.status(HttpStatus.OK).body(interprete.get());
	}

	@PostMapping
	public ResponseEntity<Object> salvar(@Valid @RequestBody Interprete interprete) {
		try {
			service.save(interprete);
			return ResponseEntity.status(HttpStatus.CREATED).body(interprete);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Erro de requisiçao");
		}
			
	}

}
