package com.example.demo.web;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping("/hello/{id}")
    public String index(@PathVariable Long id){
        return String.format("I am %d hahaha...", id);
    }
}
