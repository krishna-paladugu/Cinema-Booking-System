package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    Cart findCartByCartID(Integer cartID);
}
