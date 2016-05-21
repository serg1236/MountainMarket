package com.mountainmarket.controller;

import com.mountainmarket.util.CloudManager;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by Sergiy_Dakhniy
 */
@Controller
@Data
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private CloudManager cloudManager;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile imageMultipart) {
        File image = new File( imageMultipart.getOriginalFilename());
        try {
            imageMultipart.transferTo(image);
            String url = cloudManager.uploadImage(image).get("url").toString();

            return ResponseEntity.ok().body(url);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Unable to upload image. Try again later");
        }
    }
}
