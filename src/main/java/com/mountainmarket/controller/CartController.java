package com.mountainmarket.controller;

import com.mountainmarket.model.Tour;
import com.mountainmarket.model.User;
import com.mountainmarket.repository.TourRepository;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.convert.ReadingConverter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private TourRepository tourRepository;

    @RequestMapping(method = RequestMethod.PUT)
    @Transactional(isolation = Isolation.SERIALIZABLE)
    ResponseEntity<String> update(@RequestBody Tour tour) {
        try {
            if(tour.getParticipants().size() > tour.getCapacity()) {
                throw new Exception("Too many people");
            }
            tourRepository.save(tour);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cannot change cart. Try again later");
        }
        return ResponseEntity.ok().body(null);
    }
}
