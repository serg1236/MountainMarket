package com.mountainmarket.controller;

import com.mountainmarket.model.Tour;
import com.mountainmarket.model.User;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    ModelAndView hello(HttpServletRequest request) {
        request.getLocale().getLanguage();
        ModelAndView mv = new ModelAndView("hello");
/*        User user = new User();
        user.setLogin("admin");
        user.setPassword("1111");
        userRepository.save(user);*/
        mv.addObject("message", "hello world!");
        return mv;
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

}
