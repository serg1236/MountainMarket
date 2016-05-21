package com.mountainmarket.controller;

import com.mountainmarket.model.Place;
import com.mountainmarket.repository.PlaceRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
@RequestMapping("/admin/route")
@Data
public class AdminRouteController {

    @Autowired
    private PlaceRepository placeRepository;

    @RequestMapping(value = "/create", method= RequestMethod.GET)
    public ModelAndView showPage(@RequestParam(value = "message", required = false) String message) {
        ModelAndView mv = new ModelAndView("create-route");
        if(message != null && !message.isEmpty()) {
            mv.addObject("message", message);
        }
        return mv;
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ResponseEntity<String> create(@RequestBody Place place) {
        try {
            placeRepository.save(place);
            return ResponseEntity.ok().body("/place/"+place.getLat()+"/"+place.getLng());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cannot save place. Try again later");
        }

    }
}
