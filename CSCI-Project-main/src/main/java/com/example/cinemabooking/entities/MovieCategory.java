package com.example.cinemabooking.entities;

import javax.persistence.*;

@Entity
@Table(name = "moviecategory")
public class MovieCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "categoryID")
    private Integer categoryID;

    @Column(name = "movieID")
    private Integer movieID;

    @Column(name = "category")
    private String category;

    public Integer getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
    }

    public Integer getMovieID() {
        return movieID;
    }

    public void setMovieID(Integer movieID) {
        this.movieID = movieID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
