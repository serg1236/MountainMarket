package com.mountainmarket.controller;

import com.mountainmarket.model.User;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/")
    ModelAndView hello() {
        ModelAndView mv = new ModelAndView("hello");
        User user = new User();
        user.setLogin("admin");
        user.setPassword("1111");
        userRepository.save(user);
        mv.addObject("message", "hello world!");
        return mv;
    }
}
