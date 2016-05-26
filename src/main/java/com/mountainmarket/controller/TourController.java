package com.mountainmarket.controller;

import lombok.Data;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Serg on 5/26/2016.
 */
@Controller
@Data
@RequestMapping("/tour")
public class TourController {

    @RequestMapping("/all")
    public String getAll() {
        return "all-tours";
    }
}
