package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
    Movie findMovieByMovieID(Integer movieID);
}
