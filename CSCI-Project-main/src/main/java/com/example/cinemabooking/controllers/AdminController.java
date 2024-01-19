package com.example.cinemabooking.controllers;

import com.example.cinemabooking.entities.*;
import com.example.cinemabooking.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieCategoryService movieCategoryService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private EmailService emailService;

    @GetMapping("/main")
    public String showMain() {
        return "adminmain";
    }

    @GetMapping("/manage-movies")
    public String getMovieById() {
        return "managemovies";
    }

    @GetMapping("/add-movie")
    public String addMovie(Model model) {
        model.addAttribute("movieForm", new Movie());
        return "addmovie";
    }

    @PostMapping("/add-movie")
    public String addMovie(@ModelAttribute("movieForm") Movie movie, Model model) {
        movieService.save(movie);
        String[] movieCategoryArray = movie.getCategory().split(",");
        for (String category : movieCategoryArray) {
            MovieCategory movieCategory = new MovieCategory();
            movieCategory.setMovieID(movie.getMovieID());
            movieCategory.setCategory(category.trim());
            movieCategoryService.save(movieCategory);
        }
        model.addAttribute("message", "Movie has been added successfully");
        return "addmovie";
    }

    @GetMapping("/search-movie")
    public String searchMovie() {
        return "search-movie";
    }

    @GetMapping("/schedule-movie")
    public String scheduleMovie(Model model) {
        model.addAttribute("scheduleMovieForm", new Schedule());
        return "schedulemovie";
    }

    @PostMapping("/schedule-movie")
    public String scheduleMovie(@ModelAttribute("scheduleMovieForm") Schedule schedule, Model model) {
        ArrayList<Integer> movieIDs = new ArrayList<>();
        ArrayList<Schedule> showTimes = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT movieID FROM movies");
            while (resultSet.next()) {
                movieIDs.add(resultSet.getInt("movieID"));
            }
            resultSet = stmt.executeQuery("SELECT movieID, date, time FROM shows");
            while (resultSet.next()) {
                Schedule theSchedule = new Schedule();
                theSchedule.setMovieID(resultSet.getInt("movieID"));
                theSchedule.setDate(resultSet.getString("date"));
                theSchedule.setTime(resultSet.getString("time"));
                showTimes.add(theSchedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Schedule showTime : showTimes) {
            if (showTime.getMovieID().equals(schedule.getMovieID()) && showTime.getDate().equals(schedule.getDate()) && showTime.getTime().equals(schedule.getTime())) {
                model.addAttribute("message", "This schedule already exists for this movie");
                return "schedulemovie";
            }
        }
        if (!movieIDs.contains(schedule.getMovieID())) {
            model.addAttribute("message", "Movie does not exist");
        } else {
            model.addAttribute("message2", "Movie has been successfully scheduled");
            scheduleService.save(schedule);
        }
        return "schedulemovie";
    }

    @GetMapping("/promotion")
    public String promotion(Model model) {
        model.addAttribute("promotionForm", new Promotion());
        return "promotion";
    }

    @PostMapping("/promotion")
    public String promotion(@ModelAttribute("promotionForm") Promotion promotion, Model model) {
        if (promotion.getStartDate().compareTo(promotion.getEndDate()) > 0) {
            model.addAttribute("message2", "End date cannot be before start date");
            return "promotion";
        }
        ArrayList<SiteUser> subscribedUsers = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT * FROM customers");
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setSubscribed(resultSet.getBoolean("subscribed"));
                if (customer.getSubscribed()) {
                    SiteUser siteUser = new SiteUser();
                    siteUser.setUserID(resultSet.getInt("userID"));
                    subscribedUsers.add(siteUser);
                }
            }
            resultSet = stmt.executeQuery("SELECT * FROM users");
            while (resultSet.next()) {
                for (SiteUser subscribedUser : subscribedUsers) {
                    if (resultSet.getInt("userID") == subscribedUser.getUserID()) {
                        subscribedUser.setFirstName(resultSet.getString("firstname"));
                        subscribedUser.setEmail(resultSet.getString("email"));
                        emailService.sendPromotionEmail(subscribedUser.getEmail(), subscribedUser.getFirstName(),
                                promotion.getPromoCode(), String.valueOf(promotion.getDiscountValue()),
                                promotion.getStartDate(), promotion.getEndDate());
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "Promotion added successfully");
        promotionService.save(promotion);
        return "promotion";
    }

    @GetMapping("/manageusers")
    public String showManageUsers() {
        return "manageusers";
    }
}
