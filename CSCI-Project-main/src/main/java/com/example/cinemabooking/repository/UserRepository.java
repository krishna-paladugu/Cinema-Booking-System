package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.SiteUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<SiteUser, Integer> {
    SiteUser findByUsername(String username);
    SiteUser findByUserID(Integer ID);
}