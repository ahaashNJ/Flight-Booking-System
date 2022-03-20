package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Model.Flight;
import com.example.universal_travel_company.Repository.AirplaneRepository;
import com.example.universal_travel_company.Repository.FlightRepository;
import com.example.universal_travel_company.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
//import java.util.Date;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Service
public class FlightService {

    @Autowired
    private AirplaneRepository airplaneRepository;

    @Autowired
    private FlightRepository flightRepository;

    public Flight scheduleFlight(FlightDTO flightDTO) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        java.util.Date start = sdf.parse(String.format("%s %s", flightDTO.getFlightDate(), flightDTO.getFlightTime()));
        Flight flight = new Flight();

        //checks if information is retrieved to back end
        if (flightDTO != null) {
            //Date validation to check if the date is in the past
            if (start.before(new Date(System.currentTimeMillis()))) {
                throw new Exception("Entered Date/Time has passed. Please Enter a Valid Date/Time period");
            }
            if (start.compareTo(new Date(System.currentTimeMillis()))>30) {

                throw new Exception("Scheduling can be done with more than one month prior to the Flight Date");
            }

            //Validation to check if the selected plane is available for the given date
            List<Flight> FlightList = flightRepository.findFlightsByAirplaneAndDate(flightDTO.getAirplane(), Date.valueOf(flightDTO.getFlightDate().toString()));

            for (Flight flightInfo : FlightList) {

                if (flightDTO.getFlightDate().equals(flightInfo.getDate())) {

                    throw new Exception("Error Occurred, The " + flightDTO.getAirplane().getAirplaneName() + " is already Booked on the given date");
                }
            }

            //Validation to check if the toLocation and fromLocation are equal
            if (flightDTO.getToLocation().equals(flightDTO.getFromLocation())) {

                throw new Exception("You cannot enter the same Location");

            }


            flight.setDate(flightDTO.getFlightDate());
            flight.setTime(LocalTime.parse(flightDTO.getFlightTime()));
            flight.setFromLocation(flightDTO.getFromLocation());
            flight.setToLocation(flightDTO.getToLocation());
            flight.setRemainingSeats(flightDTO.getAirplane().getNoOfSeats());
            flight.setAirplane(flightDTO.getAirplane());


        } else {
            throw new Exception("Data was not Added to the database");
        }
        return flightRepository.save(flight);
    }

    public List<FlightDTO> viewAllFlights() {

        List<Flight> flightList = flightRepository.findAll();

        List<FlightDTO> flightDTOList = new ArrayList<>();

        if (flightList != null) {
            for (Flight flight : flightList) {
                FlightDTO flightDTO = new FlightDTO();
                flightDTO.setFlightId(flight.getFlightId());
                flightDTO.setFlightDate(flight.getDate());
                flightDTO.setFlightTime(flight.getTime().toString());
                flightDTO.setFromLocation(flight.getFromLocation());
                flightDTO.setToLocation(flight.getToLocation());
                flightDTO.setAirplane(flight.getAirplane());
                flightDTOList.add(flightDTO);

            }
        }
        return flightDTOList;

    }

    public List<FlightDTO> viewAllFutureFlights() {

        List<Flight> flightList = flightRepository.findAll();

        List<FlightDTO> flightDTOList = new ArrayList<>();

        if (flightList != null) {
            for (Flight flight : flightList) {
                if (flight.getDate().compareTo(new Date(System.currentTimeMillis())) > 0) {
                    FlightDTO flightDTO = new FlightDTO();
                    flightDTO.setFlightId(flight.getFlightId());
                    flightDTO.setFlightDate(flight.getDate());
                    flightDTO.setFlightTime(flight.getTime().toString());
                    flightDTO.setFromLocation(flight.getFromLocation());
                    flightDTO.setToLocation(flight.getToLocation());
                    flightDTO.setAirplane(flight.getAirplane());
                    flightDTOList.add(flightDTO);
                }
            }
        }
        return flightDTOList;

    }

    public void deleteFlightById(int flightId) {
        flightRepository.deleteById(flightId);
    }

    public FlightDTO viewSingleFlightById(int flightId) {
        Optional<Flight> flightOptional = flightRepository.findById(flightId);


        FlightDTO flightDTO = new FlightDTO();
        Flight flightInfo = null;


        if (flightOptional.isPresent()) {
            flightInfo = flightOptional.get();

            flightDTO.setFlightId(flightInfo.getFlightId());
            flightDTO.setFlightDate(flightDTO.getFlightDate());
            flightDTO.setFlightTime(flightDTO.getFlightTime());
            flightDTO.setRemainingSeats(flightDTO.getRemainingSeats());
            flightDTO.setFromLocation(flightDTO.getFromLocation());
            flightDTO.setToLocation(flightDTO.getFromLocation());
            flightDTO.setAirplane(flightDTO.getAirplane());

        }

        return flightDTO;
    }


    public Flight RescheduleFlight(FlightDTO flightDTO){

        Flight flight = new Flight();

        flight.setDate(flightDTO.getFlightDate());
        flight.setTime(LocalTime.parse(flightDTO.getFlightTime()));
        flight.setAirplane(flightDTO.getAirplane());

        Optional<Flight> timetables = flightRepository.findById((flightDTO.getFlightId()));

        return flightRepository.save(flight);
    }

}
