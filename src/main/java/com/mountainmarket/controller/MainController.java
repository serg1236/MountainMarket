package com.mountainmarket.controller;

import com.mountainmarket.model.Tour;
import com.mountainmarket.model.User;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/")
    ModelAndView hello(HttpServletRequest request, @RequestParam(required = false) String message) {
        request.getLocale().getLanguage();
        ModelAndView mv = new ModelAndView("hello");
        if(message != null && !message.isEmpty()) {
            mv.addObject("message", message);
        }
        return mv;
    }

    @RequestMapping(value = "/current-user", method = RequestMethod.GET)
    @ResponseBody
    private User currentUser() {
        try {
            return getCurrentUser();
        } catch (Exception e) {
            return null;
        }
    }


    @RequestMapping(value = "/about", method = RequestMethod.GET)
    private String about() {
        return "about";
    }

    @RequestMapping("/tour")
    @ResponseBody
    Tour getTour(){
        Tour tour = new Tour();
        tour.setCapacity(2);
        tour.setPrice(3000);
        tour.setStartDate(LocalDate.parse("5.12.2016", DateTimeFormatter.ofPattern("d.M.uuuu")));
        return tour;
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        return userRepository.findByLogin(userDetail.getUsername());
    }

}
