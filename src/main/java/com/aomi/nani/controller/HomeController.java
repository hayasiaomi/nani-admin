package com.aomi.nani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @GetMapping("/home")
    @ResponseBody
    public String index() {
        return "i am aomi";
    }

    @PostMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request)
    {
        MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;

        return "i am file"+ multiRequest.getFileMap();
    }
}
