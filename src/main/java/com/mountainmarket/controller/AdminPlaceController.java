package com.mountainmarket.controller;

import com.mountainmarket.model.Place;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@RequestMapping("/admin/place")
public class AdminPlaceController {

    @RequestMapping(value = "/create", method= RequestMethod.GET)
    public ModelAndView showPage(@RequestParam(value = "message", required = false) String message) {
        ModelAndView mv = new ModelAndView("create-place");
        if(message != null && !message.isEmpty()) {
            mv.addObject("message", message);
        }
        return mv;
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ResponseEntity<String> create(@RequestBody Place place) {
        return ResponseEntity.ok().body(null);
    }
}
