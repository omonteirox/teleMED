package com.bezkoder.spring.security.modules.login.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.spring.security.modules.login.models.ERole;
import com.bezkoder.spring.security.modules.login.models.Role;
import com.bezkoder.spring.security.modules.login.models.User;

import com.bezkoder.spring.security.modules.login.payload.request.LoginRequest;
import com.bezkoder.spring.security.modules.login.payload.request.SignupRequest;
import com.bezkoder.spring.security.modules.login.payload.response.MessageResponse;
import com.bezkoder.spring.security.modules.login.payload.response.UserInfoResponse;

import com.bezkoder.spring.security.modules.login.repository.RoleRepository;

import com.bezkoder.spring.security.modules.login.security.jwt.JwtUtils;
import com.bezkoder.spring.security.modules.login.security.services.UserDetailsImpl;
import com.bezkoder.spring.security.modules.login.services.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController 
{
  
  @Autowired
  AuthenticationManager authenticationManager;

  @Autowired
  UserService userService;

  @Autowired
  RoleRepository roleRepository;

  @Autowired
  PasswordEncoder encoder;

  @Autowired
  JwtUtils jwtUtils;

  @PostMapping("/signin")
  public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest)
  {

      Authentication authentication = authenticationManager
          .authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));

      SecurityContextHolder.getContext().setAuthentication(authentication);

      UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

      ResponseCookie jwtCookie = jwtUtils.generateJwtCookie(userDetails);

      List<String> roles = userDetails.getAuthorities().stream()
          .map(item -> item.getAuthority())
          .collect(Collectors.toList());

      return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, jwtCookie.toString())
          .body(  new UserInfoResponse( userDetails.getId(),userDetails.getEmail(),roles));
  }

  @PostMapping("/signup")
  public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) 
  {
     

      if (userService.existsByEmail( signUpRequest.getEmail()) ) 
      {
        return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
      }

      // Create new user's account
      User user = new User
      (
    		 signUpRequest.getName(),signUpRequest.getEmail(), encoder.encode(signUpRequest.getPassword())
      );

      Set<String> strRoles = signUpRequest.getRoles();
      Set<Role> roles = new HashSet<>();

      if (strRoles == null) 
      {
          Role userRole = new Role(ERole.ROLE_ROOT);

          roles.add(userRole);   
      } 
      else 
      {
         roles = userService.roleUser(strRoles);
      }

    user.setRoles(roles);
    userService.save(user);

    return ResponseEntity.ok( user );
  }

  @PostMapping("/signout")
  public ResponseEntity<?> logoutUser() 
  {
      ResponseCookie cookie = jwtUtils.getCleanJwtCookie();
      return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString())
          .body(new MessageResponse("You've been signed out!"));
  }
}
