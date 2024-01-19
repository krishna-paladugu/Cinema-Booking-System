package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Customer;
import com.example.cinemabooking.entities.SiteUser;
import com.example.cinemabooking.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer findByUser(SiteUser id) {
        return customerRepository.findByUser(id);
    }
}
