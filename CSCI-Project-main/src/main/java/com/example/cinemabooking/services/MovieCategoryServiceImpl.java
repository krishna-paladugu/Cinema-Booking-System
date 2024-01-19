package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.MovieCategory;
import com.example.cinemabooking.repository.MovieCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieCategoryServiceImpl implements MovieCategoryService{
    @Autowired
    private MovieCategoryRepository movieCategoryRepository;

    @Override
    public void save(MovieCategory movieCategory) {
        movieCategoryRepository.save(movieCategory);
    }

    @Override
    public MovieCategory findMovieCategoryByCategoryID(Integer categoryID) {
        return movieCategoryRepository.findMovieCategoryByCategoryID(categoryID);
    }
}
