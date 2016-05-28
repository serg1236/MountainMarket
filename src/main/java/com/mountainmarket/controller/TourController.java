package com.mountainmarket.controller;

import com.mountainmarket.model.Feedback;
import com.mountainmarket.model.Tour;
import com.mountainmarket.model.User;
import com.mountainmarket.repository.FeedbackRepository;
import com.mountainmarket.repository.TourRepository;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Serg on 5/26/2016.
 */
@Controller
@Data
@RequestMapping("/tour")
public class TourController {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    FeedbackRepository feedbackRepository;

    @RequestMapping("/all")
    public String getAll() {
        return "all-tours";
    }

    @RequestMapping("/all.rest")
    @ResponseBody
    public List<Tour> getAllJson() {
        return tourRepository.findAll();
    }


    @RequestMapping(value = "new-feedback", method = RequestMethod.PUT)
    @Transactional
    ResponseEntity<String> create(@RequestBody Tour tour) {
        try {
            Feedback feedback = tour.getFeedbacks().get(tour.getFeedbacks().size()-1);
            feedback.setAuthor(getCurrentUser());
            feedback = feedbackRepository.save(feedback);
            tour.getFeedbacks().get(tour.getFeedbacks().size()-1).setAuthor(getCurrentUser());
            tour.getFeedbacks().get(tour.getFeedbacks().size()-1).setId(feedback.getId());
            tourRepository.save(tour);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cannot add feedback. Try again later");
        }
        return ResponseEntity.ok().body(null);
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        return userRepository.findByLogin(userDetail.getUsername());
    }
}
