package com.bezkoder.spring.security.modules.login.payload.request;

import java.util.Set;

import javax.validation.constraints.*;
 
public class SignupRequest 
{
    @NotBlank
    @Size(min = 3, max = 20)
    private String username;

    @NotBlank
    @Size(min = 3, max = 20)
    private String name;
 
 
    @NotBlank
    @Size(max = 50)
    @Email
    private String email;
    
    
    private Set<String> role;
    
    @NotBlank
    @Size(min = 6, max = 40)
    private String password;
  
    @NotBlank
    @Size(max = 20)
    private String number;
  
    @NotBlank
    private String profilePicture;
    
    @NotBlank
    private String status;

  
    public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
    
    public Set<String> getRoles() {
      return this.role;
    }
    
    public void setRoles(Set<String> role) {
      this.role = role;
    }

    public String getStatus() {
      return status;
    }
  
    public void setStatus(String status) {
      this.status = status;
    }
  
    public String getNumber() {
      return number;
    }
  
    public void setNumber(String number) {
        this.number = number;
    }
  
    public String getProfilePicture() {
        return profilePicture;
    }
  
    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }
}
