package com.example.cinemabooking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.*")
public class CinemaBookingApplication {
	public static void main(String[] args) {
		SpringApplication.run(CinemaBookingApplication.class, args);
	}
}