package com.example.universal_travel_company.Controller;

import com.example.universal_travel_company.DTO.AirplaneDTO;
import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Service.AirplaneService;
import com.example.universal_travel_company.Service.FlightService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class AdminController {

    private final AirplaneService airplaneService;

    private final FlightService flightService;

    public AdminController(AirplaneService airplaneService, FlightService flightService) {
        this.airplaneService = airplaneService;
        this.flightService = flightService;
    }

    //load Admin Homepage on redirect from login
    @GetMapping("/Admin/AdminHome")
    public String adminHome(Authentication auth, Model a) {
//        User user = userService.getUser(auth.getName());
//        a.addAttribute("student", user);
        return "AdminHome";
    }

    //Load Schedule Flight page
    @GetMapping("/Admin/scheduleFlight")
    public String loadScheduleFlight(Model model) {
        //Calling the list of batches
        List<AirplaneDTO> airplaneDTOS = airplaneService.getAllPlanesForFlights();
        //Binds the lists to JSP
        model.addAttribute("listAirplanes", airplaneDTOS);
        model.addAttribute("scheduleFlights", new FlightDTO());
        //Binds the form fields of JSP to the Object
        return "scheduleFlights";
    }

    @PostMapping("/Admin/createFlight")
    public String scheduleFlight(@ModelAttribute("scheduleFlights") FlightDTO flightDTO, Model model) {
        try{
            System.out.println(flightDTO.getFlightTime());
            flightService.scheduleFlight(flightDTO);
            //Takes in the Bound Values
            model.addAttribute("success", "Flight Scheduled Successfully");
            //Binds success message
        }catch(Exception e){
            model.addAttribute("error", e.getMessage());
            //Binds error message
        }

        return "scheduleFlights";
    }

    @GetMapping("/Admin/ViewFlights")
    public String viewAllFutureFlights(Model model) {
        List<FlightDTO> flightDTOList = flightService.viewAllFutureFlights();
        model.addAttribute("successUpdate", "Successfully Updated The Flight");

        model.addAttribute("flights", flightDTOList);
        return "/ViewFlightsAdmin";
    }

    @GetMapping("/Admin/DeleteFlight/{flightId}")
    public String deleteFlight(@PathVariable(value = "flightId") int flightId, Model model, Authentication authentication) {
        try {
//            timeTableService.removeTimetable(batchId);
//            userService.removeBatchFromStudents(batchId);
            flightService.deleteFlightById(flightId);
            model.addAttribute("flights", flightService.viewAllFutureFlights());
            model.addAttribute("error", "");
            model.addAttribute("success", "The flight has been deleted successfully");
        } catch (Exception exception) {
            model.addAttribute("batches", flightService.viewAllFutureFlights());
            model.addAttribute("error", exception.getMessage());
            model.addAttribute("success", "");
            return "ViewFlightsAdmin";
        }
        return "ViewFlightsAdmin";
    }

    @GetMapping("/Admin/updateFlight/{flightId}")
    public String ViewSingleFlight(@PathVariable(value = "flightId") int flightId, Model batch) {
        FlightDTO flightDTO = flightService.viewSingleFlightById(flightId);
        //Getting the Batch ID of the clicked record
        batch.addAttribute("FlightDetails", flightDTO);

        //Binding the values of the clicked record to the JSP
        batch.addAttribute("UpdateFlight", new FlightDTO());

        //Binds the form fields of JSP to the Object
        return "/UpdateFlight";
    }

    //-------------------------Updating the Flight-------------------------

    @PostMapping("/Admin/AdminUpdateFlight")
    public String updateBatch(@ModelAttribute("UpdateFlight") FlightDTO flightDTO, Model model) {
        try{
            flightService.RescheduleFlight(flightDTO);
            //Takes in the data from the bound fields
            model.addAttribute("success", "Successfully Updated The Flight");
            //Bind success message
        }
        catch(Exception e){
            model.addAttribute("error", "Failed To Update The Flight");
            //Bind error message
        }

        return "redirect:/Admin/ViewFlights";
    }

}
