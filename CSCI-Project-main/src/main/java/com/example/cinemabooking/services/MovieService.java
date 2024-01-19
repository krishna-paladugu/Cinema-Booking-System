package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Movie;

public interface MovieService {
	void save(Movie movie);
	Movie findMovieByMovieID(Integer movieID);
}