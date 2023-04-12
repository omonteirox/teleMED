package com.bezkoder.spring.security.modules.login.payload.response;

import java.util.List;

public class UserInfoResponse 
{
	private Long id;
	private String email;
	private List<String> roles;

	public UserInfoResponse(Long id,  String email, List<String> roles) 
	{
		this.id = id;
		this.email = email;
		this.roles = roles;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public List<String> getRoles() {
		return roles;
	}
}
