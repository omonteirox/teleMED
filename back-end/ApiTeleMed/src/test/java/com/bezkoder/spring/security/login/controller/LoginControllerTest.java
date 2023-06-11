package com.bezkoder.spring.security.login.controller;

import com.bezkoder.spring.security.modules.login.controllers.AuthController;
import com.bezkoder.spring.security.modules.login.models.ERole;
import com.bezkoder.spring.security.modules.login.models.Role;
import com.bezkoder.spring.security.modules.login.models.User;
import com.bezkoder.spring.security.modules.login.payload.request.LoginRequest;
import com.bezkoder.spring.security.modules.login.payload.request.SignupRequest;
import com.bezkoder.spring.security.modules.login.payload.response.UserInfoResponse;
import com.bezkoder.spring.security.modules.login.security.jwt.JwtUtils;
import com.bezkoder.spring.security.modules.login.security.services.UserDetailsImpl;
import com.bezkoder.spring.security.modules.login.services.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

class AuthControllerTest {

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private UserService userService;

    @Mock
    private PasswordEncoder encoder;

    @Mock
    private JwtUtils jwtUtils;

    @InjectMocks
    private AuthController authController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAuthenticateUser() {
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setEmail("test@example.com");
        loginRequest.setPassword("password");

        Authentication authentication = mock(Authentication.class);
        when(authenticationManager.authenticate(any())).thenReturn(authentication);

        UserDetailsImpl userDetails = mock(UserDetailsImpl.class);
        when(authentication.getPrincipal()).thenReturn(userDetails);
        when(jwtUtils.generateJwtCookie(userDetails)).thenReturn(ResponseCookie.from("jwtCookie", "jwtValue").build());
        when(userDetails.getAuthorities()).thenReturn(Collections.emptyList());

        ResponseEntity<?> response = authController.authenticateUser(loginRequest);
        assertEquals("jwtCookie=jwtValue", response.getHeaders().getFirst(HttpHeaders.SET_COOKIE));
        assertEquals(200, response.getStatusCodeValue());
    }

    @Test
    void testRegisterUser() {
        SignupRequest signupRequest = new SignupRequest();
        signupRequest.setName("Test User");
        signupRequest.setEmail("test@example.com");
        signupRequest.setPassword("123456");

        User user = new User();
        user.setName("Test User");
        user.setEmail("tes1t@example.com");
        user.setPassword("123456");

        Set<String> strRoles = new HashSet<>();
        strRoles.add("ROLE_USER");

        Set<Role> roles = new HashSet<>();
        Role userRole = new Role(ERole.ROLE_ROOT);
        roles.add(userRole);

        when(userService.existsByEmail("test1@example.com")).thenReturn( true );
        when(encoder.encode("password")).thenReturn("encodedPassword");
        when(userService.roleUser(strRoles)).thenReturn(roles);
        when(userService.save(user)).thenReturn(user);

        ResponseEntity<?> response = authController.registerUser(signupRequest);
        userService.save(user);

        assertEquals(200, response.getStatusCodeValue());

    }

  
}