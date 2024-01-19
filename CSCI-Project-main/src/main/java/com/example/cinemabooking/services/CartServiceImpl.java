package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Cart;
import com.example.cinemabooking.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartRepository cartRepository;

    @Override
    public void save(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public Cart findCartByCartID(Integer cartID) {
        return cartRepository.findCartByCartID(cartID);
    }
}
