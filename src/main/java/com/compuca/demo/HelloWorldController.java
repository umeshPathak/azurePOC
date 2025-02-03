package com.compuca.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping("/hello")
    public String helloWorld(@RequestParam(required = false, defaultValue = "Guest") String name) {
        return "Hello World! " + name;
    }
}
