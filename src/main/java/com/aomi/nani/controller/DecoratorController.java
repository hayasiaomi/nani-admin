package com.aomi.nani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/decorator")
public class DecoratorController {
    @GetMapping("/default")
    public String defaultDecorator() {

        return "decorator/default.layout";
    }
}
