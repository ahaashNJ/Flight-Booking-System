package com.example.universal_travel_company.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VisitorController {

    //Homepage
    @GetMapping("/Home")
    public String getLogin() {
        return "Home";
    }
}
