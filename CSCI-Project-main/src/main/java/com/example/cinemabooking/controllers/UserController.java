package com.example.cinemabooking.controllers;

import com.example.cinemabooking.entities.Cart;
import com.example.cinemabooking.entities.Customer;
import com.example.cinemabooking.entities.SiteUser;
import com.example.cinemabooking.services.CartService;
import com.example.cinemabooking.services.CustomerService;
import com.example.cinemabooking.services.EmailService;
import com.example.cinemabooking.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CartService cartService;

    @GetMapping("/signin")
    public String showLogin() {
        return "signin";
    }

    @GetMapping("/signup")
    public String registration(Model model) {
        model.addAttribute("userForm", new SiteUser());
        return "signup";
    }

    @GetMapping("/signupconfirm")
    public String showSignupConfirm() {
        return "registrationconfirmation";
    }

    @PostMapping("/signup")
    public String registration(@ModelAttribute("userForm") SiteUser userForm, Model model, BindingResult bindingResult) {
        SiteUser existingUser = userService.findByUsername(userForm.getUsername());
        if (existingUser != null) {
            model.addAttribute("message", "This username has already been taken");
            return "signup";
        } else {
            userService.save(userForm);
            Customer customer = new Customer();
            customer.setUser(userForm);
            customer.setAddress(userForm.getAddress());
            customer.setCity(userForm.getCity());
            customer.setState(userForm.getState());
            customer.setZipCode(userForm.getZipCode());
            customerService.save(customer);
            emailService.sendVerificationEmail(userForm.getEmail(), userForm.getFirstName());
            return "redirect:/signupconfirm";
        }
    }

    @GetMapping("/changepassword")
    public String changePassword(Model model) {
        model.addAttribute("changePassword", new SiteUser());
        return "changepassword";
    }

    @PostMapping("/changepassword")
    public String changePassword(@ModelAttribute("changePassword") SiteUser user) {
        String theUsername = user.getUsername();
        String newPassword = user.getPassword();
        String encryptedPassword = new BCryptPasswordEncoder().encode(newPassword);
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            Statement stmt = conn.createStatement();
            String query = "UPDATE users SET password = '" + encryptedPassword + "'" + " WHERE username = '" + theUsername + "'";
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:/signin";
    }

    @GetMapping("/profile")
    public String showProfile() {
        return "profile";
    }

    @GetMapping("/profile/editprofile")
    public String editProfile(Model model) {
        model.addAttribute("editprofile", new SiteUser());
        return "editprofile";
    }

    @PostMapping("/profile/editprofile")
    public String editProfile(@ModelAttribute("editprofile") SiteUser user, Customer customer) {
        String firstName = user.getFirstName();
        String lastName = user.getLastName();
        int userID = 0;
        String userName = user.getUsername();
        String email = user.getEmail();
        String phone = user.getPhone();
        String address = customer.getAddress();
        String city = customer.getCity();
        String state = customer.getState();
        String zipCode = customer.getZipCode();
        Boolean subscribed = customer.getSubscribed();
        if (subscribed == null) {
            subscribed = false;
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE users SET firstname = ?, lastname = ?, username = ?, phone = ? WHERE email = ?");
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, phone);
            preparedStatement.setString(5, email);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT userID FROM users WHERE email = " + "'" + email + "'");
            while (resultSet.next()) {
                userID = resultSet.getInt("userID");
            }
            PreparedStatement preparedStatement2 = conn.prepareStatement("UPDATE customers SET address = ?, city = ?, state = ?, zipcode = ?, subscribed = ? WHERE userID = ?");
            preparedStatement2.setString(1, address);
            preparedStatement2.setString(2, city);
            preparedStatement2.setString(3, state);
            preparedStatement2.setString(4, zipCode);
            preparedStatement2.setBoolean(5, subscribed);
            preparedStatement2.setInt(6, userID);
            preparedStatement2.executeUpdate();
            preparedStatement2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:/profile";
    }

    @GetMapping("/moviegallery")
    public String showTimes(Model model) {
        model.addAttribute("bookingForm", new Cart());
        return "moviegallery";
    }

    @PostMapping("/moviegallery")
    public String showTimes(@ModelAttribute("bookingForm") Cart cart, Model model) {
        cartService.save(cart);
        return "redirect:/showtimes";
    }

    @GetMapping("/showtimes")
    public String showMovieGallery(Model model) {
        model.addAttribute("bookingForm", new Cart());
        return "showtimes";
    }

    @PostMapping("/showtimes")
    public String showMovieGallery(@ModelAttribute("bookingForm") Cart cart, Model model) {
        String time = cart.getTime();
        String movieTitle = cart.getTicketType();
        String date = cart.getDate();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE cart SET time = ?, date = ? WHERE movieID = (SELECT movieID FROM movies WHERE movietitle = ?) ORDER BY cartID DESC LIMIT 1");
            preparedStatement.setString(1, time);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, movieTitle);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:/selectseats";
    }

    @GetMapping("/selectseats")
    public String showSeats(Model model) {
        model.addAttribute("bookingForm", new Cart());
        return "selectseats";
    }

    @PostMapping("/selectseats")
    public String showSeats(@ModelAttribute("bookingForm") Cart cart, Model model) {
        String seats = cart.getSeats();
        int movieID = 0;
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/cinemabookingsystem", "root", "password");
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT movieID FROM cart ORDER BY cartID DESC LIMIT 1");
            while (resultSet.next()) {
                movieID = resultSet.getInt("movieID");
            }
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE cart SET seats = ? WHERE movieID = ? ORDER BY cartID DESC LIMIT 1");
            preparedStatement.setString(1, seats);
            preparedStatement.setInt(2, movieID);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:/ordersummary";
    }

    @GetMapping("/ordersummary")
    public String showOrderSummary(Model model) {
        return "ordersummary";
    }

    @GetMapping("/checkout")
    public String showCheckout() {
        return "checkout";
    }

    @GetMapping("/signout-success")
    public String showLogout() {
        return "signout";
    }
}