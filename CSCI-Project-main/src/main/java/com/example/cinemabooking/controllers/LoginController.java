package com.example.cinemabooking.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/orderconfirmation")
    public String showOrderConfirm() {
        return "orderconfirmation";
    }
}
