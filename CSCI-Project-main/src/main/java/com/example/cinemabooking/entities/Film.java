package com.example.cinemabooking.entities;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class Film {

    private String imdbID;
    private String title;
    private String rated;
    private String genre;
    private String actors;
    private String directors;
    private String writer;
    private String plot;
    private String imdbRating;
    private String metaScore;
    private String poster;
    private double price;

    private static final String ENDPOINT_URL = "https://www.omdbapi.com/?apikey=";
    private static final String API_KEY = "3e0272a7";
    private InputStreamReader reader;
    private URL queryURL;

    public Film(String movie) {
        getMovie(movie);
    }

    private String encodeURL(String queryStringURL) {
        URLEncoder.encode(queryStringURL, StandardCharsets.UTF_8);
        return queryStringURL;
    }

    private void downloadResult(String queryURL) {
        try {
            this.queryURL = new URL(queryURL);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        try {
            reader = new InputStreamReader(this.queryURL.openStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void parseResultSetAttributes(InputStreamReader reader) {
        JsonElement jsonElement = JsonParser.parseReader(reader);
        JsonObject jsonObject = jsonElement.getAsJsonObject();
        setTitle(jsonObject.get("Title").getAsString());
        setGenre(jsonObject.get("Genre").getAsString());
        setActors(jsonObject.get("Actors").getAsString());
        setDirectors(jsonObject.get("Director").getAsString());
        setWriter(jsonObject.get("Writer").getAsString());
        setPlot(jsonObject.get("Plot").getAsString());
        setPoster(jsonObject.get("Poster").getAsString());
        setImdbRating(jsonObject.get("imdbRating").getAsString());
        setMetaScore(jsonObject.get("Metascore").getAsString());
        setRated(jsonObject.get("Rated").getAsString());
    }

    public void getMovie(String searchTerm) {
        String queryStringURL = ENDPOINT_URL + API_KEY + searchTerm;
        downloadResult(encodeURL(queryStringURL));
        parseResultSetAttributes(reader);
    }

    public String getImdbID() {
        return imdbID;
    }

    public void setImdbID(String imdbID) {
        this.imdbID = imdbID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPlot() {
        return plot;
    }

    public void setPlot(String plot) {
        this.plot = plot;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public String getDirectors() {
        return directors;
    }

    public void setDirectors(String directors) {
        this.directors = directors;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getImdbRating() {
        return imdbRating;
    }

    public void setImdbRating(String imdbRating) {
        this.imdbRating = imdbRating;
    }

    public String getMetaScore() {
        return metaScore;
    }

    public void setMetaScore(String metaScore) {
        this.metaScore = metaScore;
    }

    public double getPrice() {
        return price;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
