package com.bezkoder.spring.security.modules.login.security.oauth2.user;

import java.util.Map;

import com.bezkoder.spring.security.modules.login.exception.OAuth2AuthenticationProcessingException;

import static com.bezkoder.spring.security.modules.login.models.AuthProvider.google;

public class OAuth2UserInfoFactory {

    public static OAuth2UserInfo getOAuth2UserInfo(String registrationId, Map<String, Object> attributes) {
        if(registrationId.equalsIgnoreCase(google.toString())) {
            return new GoogleOAuth2UserInfo(attributes);
        } else {
            throw new OAuth2AuthenticationProcessingException("Sorry! Login with " + registrationId + " is not supported yet.");
        }
    }
}
