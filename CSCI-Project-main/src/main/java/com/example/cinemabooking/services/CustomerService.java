package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Customer;
import com.example.cinemabooking.entities.SiteUser;

public interface CustomerService {
    void save(Customer customer);
    Customer findByUser(SiteUser userID);
}
