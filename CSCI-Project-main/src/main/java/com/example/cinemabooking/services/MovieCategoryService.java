package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.MovieCategory;

public interface MovieCategoryService {
    void save(MovieCategory movieCategory);
    MovieCategory findMovieCategoryByCategoryID(Integer categoryID);
}
