package com.mountainmarket.controller;

import com.mountainmarket.model.Request;
import com.mountainmarket.model.Tour;
import com.mountainmarket.repository.RequestRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Sergiy_Dakhniy
 */
@Data
@Controller
public class RequestController {

    @Autowired
    private RequestRepository requestRepository;

    @RequestMapping(value = "/request/new", method = RequestMethod.POST)
    ResponseEntity<String> create(@RequestBody Request request) {
        try {
            requestRepository.save(request);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cannot save tour. Try again later");
        }
        return ResponseEntity.ok().body(null);
    }

    @RequestMapping(value = "/request", method = RequestMethod.GET)
    @ResponseBody
    List<Request> getAll() {
        return requestRepository.findAll();
    }

    @RequestMapping(value = "/admin/requests", method = RequestMethod.GET)
    String showPage() {
        return "requests";
    }

    @RequestMapping(value = "/admin/requests/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    String delete(@PathVariable("id") int id) {
        Request request = requestRepository.findOne(id);
        requestRepository.delete(request);
        return "OK";
    }

}
