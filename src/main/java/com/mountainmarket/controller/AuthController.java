package com.mountainmarket.controller;

import com.mountainmarket.model.User;
import com.mountainmarket.model.UserStatus;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
public class AuthController {

    @Autowired
    private UserRepository userRepository;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @RequestMapping("/login-check")
    ResponseEntity<String> loginCheck(@RequestBody User checkUser) {
        User user = userRepository.findByLogin(checkUser.getLogin());
        if (user != null && encoder.matches(checkUser.getPassword(),user.getPassword())) {
            return ResponseEntity.ok().body(null);
        } else {
            return  ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }

    @RequestMapping("/register")
    String registerPage() {
        return "register";
    }

    @RequestMapping(value = "/register/new", method = RequestMethod.POST)
    @Transactional(isolation = Isolation.SERIALIZABLE)
    String registerUser(@RequestParam String login, @RequestParam String email, @RequestParam String password){
        ModelAndView mv = new ModelAndView("hello");
        try {
            User user = new User();
            user.setLogin(login);
            user.setEmail(email);
            user.setPassword(encoder.encode(password));
            user.setRole("ROLE_REGISTERED_USER");
            user.setStatus(UserStatus.ACTIVE);
            userRepository.save(user);
            return "redirect:/?message=Registration successful!";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/?message=Registration failed. Please, try again later";
        }
    }

    @RequestMapping("register/check")
    @Transactional(isolation = Isolation.SERIALIZABLE)
    ResponseEntity<String> checkIfExists(@RequestBody User checkUser) {
        User user = userRepository.findByLoginOrEmail(checkUser.getLogin(), checkUser.getEmail());
        if(user != null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        } else {
            return ResponseEntity.ok().body(null);
        }
    }


    @PostConstruct
    public void initAdmin() {
        /*User user = new User();
        user.setPassword(encoder.encode("1111"));
        user.setLogin("admin");
        user.setRole("ROLE_ADMIN");
        user.setEmail("admin@gmail.com");
        user.setStatus(UserStatus.ACTIVE);
        userRepository.save(user);*/
    }


}
