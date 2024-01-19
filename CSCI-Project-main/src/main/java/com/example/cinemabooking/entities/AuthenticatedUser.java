package com.example.cinemabooking.entities;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class AuthenticatedUser {

    private final String username;

    public AuthenticatedUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        this.username = auth.getName();
    }

    public String getUsername() {
        return username;
    }
}