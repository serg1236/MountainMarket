package com.mountainmarket.controller;

import com.mountainmarket.exception.ResourceNotFoundException;
import com.mountainmarket.model.Place;
import com.mountainmarket.repository.PlaceRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
@RequestMapping("/place")
public class PlaceController {

    @Autowired
    PlaceRepository placeRepository;

    @RequestMapping("/{lat}/{lng:.+}")
    public ModelAndView getPlace(@PathVariable("lat") String lat, @PathVariable("lng") String lng) {
        ModelAndView mv = new ModelAndView("show-place");
        Place place = placeRepository.findByLatAndLng(lat, lng);
        if(place != null) {
            mv.addObject("place", place);
            return mv;
        } else {
            throw new ResourceNotFoundException();
        }

    }

    @RequestMapping("/all.rest")
    @ResponseBody
    public List<Place> getAll() {
        return placeRepository.findAll();
    }
}