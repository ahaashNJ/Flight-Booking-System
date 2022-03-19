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

    @GetMapping("/SuccessLogin")
    public String successLogin(Authentication auth){
        System.out.println("Coming to login");
        User usertype = userservice.directUserType(auth.getName());
        //Take the user type of the logged in user

        if(usertype.getUserType().equals("Admin")){
            return "redirect:/AdminHome";
            //Directs to the admin home page if the user is admin
        }
        if(usertype.getUserType().equals("Traveler")){
            return "redirect:/TravelerHome";
            //Directs to the traveler home page if the user is traveler
        }

        return "/Home";
    }

    //-------------------------Directing to the Register User Page-------------------------

    @GetMapping("/createUser")
    public String RegisterUser(Model model) {
        model.addAttribute("AddUser", new UserDTO());
        //Binding the form fields of JSP to Object
        return "/Register";
    }

    //-------------------------Add User to the System-------------------------
    @PostMapping("/RegisterUser")
    public String addUser(@ModelAttribute("AddUser") UserDTO userdto, Model model) {
        try{
            System.out.println("AAWAAAAAAAAAAA");
            User user = userservice.createUser(userdto);
            //Takes in the bound data from the JSP
            if(user == null){
                model.addAttribute("error","Email exists in the System");
                //Binding error message
                System.out.println("error");
            }
            else{
                model.addAttribute("success","User Added Successfully");
                //Binding success message
            }
        }catch (Exception e){
            model.addAttribute("error","Failed To Add User");
            //Binding error message for exceptions
        }
        return "/Register";
    }


}
