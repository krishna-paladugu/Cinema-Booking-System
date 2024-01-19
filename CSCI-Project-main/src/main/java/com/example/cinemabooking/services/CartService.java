package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Cart;

public interface CartService {
    void save(Cart cart);
    Cart findCartByCartID(Integer cartID);
}
