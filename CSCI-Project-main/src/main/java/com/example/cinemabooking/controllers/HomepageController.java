package com.example.cinemabooking.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomepageController {
	@GetMapping("/")
	public String showHomePage() {
		return "home";
	}
}
