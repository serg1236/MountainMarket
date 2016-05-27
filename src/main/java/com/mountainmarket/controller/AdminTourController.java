package com.mountainmarket.controller;

import com.mountainmarket.model.Tour;
import com.mountainmarket.repository.TourRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Serg on 5/26/2016.
 */
@Controller
@RequestMapping("/admin/tour")
@Data
public class AdminTourController {

    @Autowired
    TourRepository tourRepository;

    @RequestMapping(value = "create", method = RequestMethod.POST)
    ResponseEntity<String> create(@RequestBody Tour tour) {
        try {
            tourRepository.save(tour);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cannot save tour. Try again later");
        }
        return ResponseEntity.ok().body(null);
    }
}
