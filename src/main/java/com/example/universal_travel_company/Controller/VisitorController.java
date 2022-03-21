package com.example.universal_travel_company.Controller;

import com.example.universal_travel_company.DTO.UserDTO;
import com.example.universal_travel_company.Model.User;
import com.example.universal_travel_company.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class VisitorController {

    @Autowired
    public UserService userservice; //Creating userService object

    //Homepage
    @GetMapping("/Home")
    public String getHome() {
        return "Home";
    }

    //Direct to Login Page
    @GetMapping("/Login")
    public String getLogin(){
        return "Login";
    }

    //Role Based Login
    @GetMapping("/SuccessLogin")
    public String successLogin(Model model, Authentication auth){
        System.out.println("Coming to login");
        User usertype = userservice.directUserType(auth.getName());

        if(usertype.getUserType().equals("Admin")){
            return "redirect:/Admin/AdminHome";
        }
        if(usertype.getUserType().equals("Traveler")){
            model.addAttribute("loggedUser", userservice.directUserType(auth.getName()));
            return "redirect:/TravelerHome";
        }

        return "/Home";
    }

    //Directs the User to the Register page
    @GetMapping("/createUser")
    public String RegisterUser(Model model) {
        try {
            model.addAttribute("AddUser", new UserDTO());
        }
        catch(Exception exception){
            model.addAttribute("error", exception.getMessage());
        }
        return "/Register";
    }

    //Add User to the System
    @PostMapping("/RegisterUser")
    public String addUser(@ModelAttribute("AddUser") UserDTO userdto, Model model) {
        try{
            User user = userservice.createUser(userdto);
            if(user == null){
                model.addAttribute("error","Email exists in the System");
                System.out.println("error");
            }
            else{
                model.addAttribute("success","User Added Successfully");
            }
        }catch (Exception e){
            model.addAttribute("error","Failed To Add User");
        }
        return "/Register";
    }


}
