package com.example.cinemabooking.repository;

import com.example.cinemabooking.entities.MovieCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieCategoryRepository extends JpaRepository<MovieCategory, Integer> {
    MovieCategory findMovieCategoryByCategoryID(Integer categoryID);
}
