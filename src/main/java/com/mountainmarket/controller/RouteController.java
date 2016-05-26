package com.mountainmarket.controller;

import com.mountainmarket.exception.ResourceNotFoundException;
import com.mountainmarket.model.Route;
import com.mountainmarket.repository.RouteRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Sergiy_Dakhniy
 */
@Data
@Controller
@RequestMapping("/route")
public class RouteController {

    @Autowired
    private RouteRepository routeRepository;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView showPage(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("show-route");
        Route route = routeRepository.findOne(id);
        if(route == null) {
            throw new ResourceNotFoundException();
        }
        mv.addObject("route", route);
        return mv;
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Route> getAll() {
        return routeRepository.findAll();
    }
}
