package com.example.universal_travel_company.Controller;

import com.example.universal_travel_company.DTO.BookingDTO;
import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.DTO.UserDTO;
import com.example.universal_travel_company.Model.User;
import com.example.universal_travel_company.Service.BookingService;
import com.example.universal_travel_company.Service.FlightService;
import com.example.universal_travel_company.Service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

@Controller
public class TravelerController {

    private final FlightService flightService;

    private final UserService userService;

    private final BookingService bookingService;

    public TravelerController(FlightService flightService, UserService userService, BookingService bookingService) {
        this.flightService = flightService;
        this.userService = userService;
        this.bookingService = bookingService;
    }

    //Load traveler Homepage on redirect from login
    @GetMapping("/TravelerHome")
    public String travelerHome(Authentication auth, Model model) {
        List<FlightDTO> flightDTOList = flightService.viewAllFutureFlights();
        model.addAttribute("flights", flightDTOList);
        return "TravelerHome";
    }

    @GetMapping("/Traveler/SearchFlightName")
    public String getBatchSearchRequest(HttpServletRequest request, Model model) throws ParseException {
        String searchItem = request.getParameter("searchItem");
        List<FlightDTO> allFlights = flightService.getAllFutureFlightsSearch(searchItem);

        model.addAttribute("flights", allFlights);
        return "TravelerHome";
    }

    @GetMapping("Traveler/BookFlight/{flightId}")
    public String ScheduleClass(@PathVariable(value = "flightId") int flightId, Model model, Authentication auth) {
        FlightDTO flight = flightService.viewSingleFlightById(flightId);
        User usertype = userService.directUserType(auth.getName());
        model.addAttribute("loggedUser", userService.directUserType(auth.getName()));
        model.addAttribute("FlightDetails", flight);
        model.addAttribute("placeBooking", new BookingDTO());
        return "Booking";
    }

    @PostMapping("/Admin/placeBooking")
    public String Schedule(@ModelAttribute("placeBooking") BookingDTO bookingDTO, Model model, Authentication auth) {
        try{

            User usertype = userService.directUserType(auth.getName());
            model.addAttribute("loggedUser", userService.directUserType(auth.getName()));
            bookingService.placeBooking(bookingDTO);
            model.addAttribute("success", "Tickets Booked Successfully");
        }catch(Exception e){
            model.addAttribute("error", "Failed To Book Tickets");
        }

        return "Booking";
    }
}
