package com.example.cinemabooking.entities;

import javax.persistence.*;

@Entity
@Table(name = "shows")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "showID")
    private Integer showID;

    @Column(name = "movieID")
    private Integer movieID;

    @Column(name = "cinemahallname")
    private String cinemahallName;

    @Column(name = "date")
    private String date;

    @Column(name = "time")
    private String time;

    public Integer getShowID() {
        return showID;
    }

    public void setShowID(Integer showID) {
        this.showID = showID;
    }

    public Integer getMovieID() {
        return movieID;
    }

    public void setMovieID(Integer movieID) {
        this.movieID = movieID;
    }

    public String getCinemahallName() {
        return cinemahallName;
    }

    public void setCinemahallName(String cinemahallName) {
        this.cinemahallName = cinemahallName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
