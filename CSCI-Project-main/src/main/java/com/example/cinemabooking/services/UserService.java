package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.SiteUser;

public interface UserService {
    void save(SiteUser user);
    SiteUser findByUsername(String username);
    SiteUser findByUserID(Integer ID);
}