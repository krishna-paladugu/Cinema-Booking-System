package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.Customer;
import com.example.cinemabooking.entities.SiteUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    Customer findByUser(SiteUser userID);
}
