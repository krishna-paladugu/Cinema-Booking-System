package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Movie;
import com.example.cinemabooking.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieRepository movieRepository;

    @Override
    public void save(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public Movie findMovieByMovieID(Integer movieID) {
        return movieRepository.findMovieByMovieID(movieID);
    }
}