package com.bezkoder.spring.security.modules.login.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table
public class Interprete implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 120)
	private String name;

	@NotBlank
	@Size(max = 120)
	private String disponibilidade;

	@NotBlank
	@Size(max = 120)
	private String informacoesParaContato;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getDisponibilidade() {
		return disponibilidade;
	}

	public void setDisponibilidade(String disponibilidade) {
		this.disponibilidade = disponibilidade;
	}

	public String getInformacoesParaContato() {
		return informacoesParaContato;
	}

	public void setInformacoesParaContato(String informacoesParaContato) {
		this.informacoesParaContato = informacoesParaContato;
	}

}
