package com.example.universal_travel_company.Controller;

import com.example.universal_travel_company.DTO.AirplaneDTO;
import com.example.universal_travel_company.DTO.BookingDTO;
import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Service.AirplaneService;
import com.example.universal_travel_company.Service.BookingService;
import com.example.universal_travel_company.Service.FlightService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AdminController {

    private final AirplaneService airplaneService;

    private final FlightService flightService;

    private final BookingService bookingService;

    public AdminController(AirplaneService airplaneService, FlightService flightService, BookingService bookingService) {
        this.airplaneService = airplaneService;
        this.flightService = flightService;
        this.bookingService = bookingService;
    }

    //load Admin Homepage on redirect from login
    @GetMapping("Admin/AdminHome")
    public String adminHome(Authentication auth, Model a) {
        return "AdminHome";
    }

    //Load Schedule Flight page and load the planes list for selection
    @GetMapping("/Admin/scheduleFlight")
    public String loadScheduleFlight(Model model) {
        List<AirplaneDTO> airplaneDTOS = airplaneService.getAllPlanesForFlights();
        model.addAttribute("listAirplanes", airplaneDTOS);
        model.addAttribute("scheduleFlights", new FlightDTO());
        return "scheduleFlights";
    }

    //Schedule a Flight
    @PostMapping("/Admin/createFlight")
    public String scheduleFlight(@ModelAttribute("scheduleFlights") FlightDTO flightDTO, Model model) {
        try{
            System.out.println(flightDTO.getFlightTime());
            flightService.scheduleFlight(flightDTO);
            model.addAttribute("success", "Flight Scheduled Successfully");
        }catch(Exception e){
            model.addAttribute("error", e.getMessage());
        }

        return "scheduleFlights";
    }

    //View All Flights By Admin
    @GetMapping("/Admin/ViewFlights")
    public String viewAllFutureFlights(Model model) {
        List<FlightDTO> flightDTOList = flightService.viewAllFutureFlights();
        model.addAttribute("successUpdate", "Successfully Updated The Flight");

        model.addAttribute("flights", flightDTOList);
        return "/ViewFlightsAdmin";
    }

    //Delete Flights
    @GetMapping("/Admin/DeleteFlight/{flightId}")
    public String deleteFlight(@PathVariable(value = "flightId") int flightId, Model model, Authentication authentication) {
        try {
            flightService.deleteFlightById(flightId);
            model.addAttribute("flights", flightService.viewAllFutureFlights());
            model.addAttribute("success", "The flight has been deleted successfully");
        } catch (Exception exception) {
            model.addAttribute("flights", flightService.viewAllFutureFlights());
            model.addAttribute("error", exception.getMessage());
            return "ViewFlightsAdmin";
        }
        return "ViewFlightsAdmin";
    }

    //Load Reschedule Flight page
    @GetMapping("/Admin/updateFlight/{flightId}")
    public String ViewSingleFlight(@PathVariable(value = "flightId") int flightId, Model batch) {
        FlightDTO flightDTO = flightService.viewSingleFlightById(flightId);
        batch.addAttribute("FlightDetails", flightDTO);
        batch.addAttribute("UpdateFlight", new FlightDTO());

        return "/UpdateFlight";
    }

    //Reschedule the Flight
    @PostMapping("/Admin/AdminUpdateFlight")
    public String updateBatch(@ModelAttribute("UpdateFlight") FlightDTO flightDTO, Model model) {
        try{
            flightService.RescheduleFlight(flightDTO);
            model.addAttribute("success", "Successfully Updated The Flight");
        }
        catch(Exception e){
            model.addAttribute("error", "Failed To Update The Flight");
        }

        return "redirect:/Admin/ViewFlights";
    }

    //View All Bookings By Admin
    @GetMapping("/Admin/ViewBookings")
    public String viewAllBookings(Model model) {
        List<BookingDTO> BookingDTOList = bookingService.getALlBookings();

        model.addAttribute("bookings", BookingDTOList);
        return "/ViewBookingsAdmin";
    }

}
