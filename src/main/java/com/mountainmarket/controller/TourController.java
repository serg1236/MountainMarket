package com.mountainmarket.controller;

import com.mountainmarket.model.Tour;
import com.mountainmarket.repository.TourRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/all")
    public String getAll() {
        return "all-tours";
    }

    @RequestMapping("/all.rest")
    @ResponseBody
    public List<Tour> getAllJson() {
        return tourRepository.findAll();
    }
}
