package com.mountainmarket.controller;

import com.mountainmarket.model.User;
import com.mountainmarket.model.UserStatus;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/login-check")
    ResponseEntity<String> loginCheck(@RequestBody User checkUser) {
        User user = userRepository.findByLogin(checkUser.getLogin());
        if (user != null && checkUser.getPassword().equals(user.getPassword())) {
            return ResponseEntity.ok().body(null);
        } else {
            return ResponseEntity.ok().body(null);
            //return  ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }

    @PostConstruct
    public void initAdmin() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User user = new User();
        user.setPassword(encoder.encode("1111"));
        user.setLogin("admin");
        user.setRole("ROLE_ADMIN");
        user.setEmail("admin@gmail.com");
        user.setStatus(UserStatus.ACTIVE);
        userRepository.save(user);
    }
}
