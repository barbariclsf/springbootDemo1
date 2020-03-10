package com.example.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
    @RequestMapping("/test")
    public String test1(){
        return "index";
    }
}
