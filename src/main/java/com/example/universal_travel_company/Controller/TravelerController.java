package com.example.universal_travel_company.Controller;

import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Model.Flight;
import com.example.universal_travel_company.Model.User;
import com.example.universal_travel_company.Service.FlightService;
import com.example.universal_travel_company.Service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class TravelerController {

    private final FlightService flightService;

    private final UserService userService;

    public TravelerController(FlightService flightService, UserService userService) {
        this.flightService = flightService;
        this.userService = userService;
    }

    //Load traveler Homepage on redirect from login
    @GetMapping("/TravelerHome")
    public String travelerHome(Authentication auth, Model model) {
        List<FlightDTO> flightDTOList = flightService.viewAllFutureFlights();
//        User user = userService.(auth.getName());
        model.addAttribute("flights", flightDTOList);
        return "TravelerHome";
    }

    @GetMapping("/Traveler/SearchFlightName")
    public String getBatchSearchRequest(HttpServletRequest request, Model model) throws ParseException {
        String searchItem = request.getParameter("searchItem");
//        SimpleDateFormat searchDate = new SimpleDateFormat("yyyy-MM-dd");
//        Date startDate = searchDate.parse(Date);
        List<FlightDTO> allFlights = flightService.getAllFutureFlightsSearch(searchItem);

        model.addAttribute("flights", allFlights);
        return "TravelerHome";
    }
}
