package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Model.Flight;
import com.example.universal_travel_company.Repository.FlightRepository;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@SpringBootTest
public class FlightServiceTest {

    @Autowired
    private FlightService flightService;

    @Autowired
    private FlightRepository flightRepository;

    List<Flight> flightId;

    @Test
    @Order(1)
    public void viewAllFutureFlights() {

            List<FlightDTO> flightDTOList = flightService.viewAllFutureFlights();

            boolean isTrue = flightDTOList.size() > 0;

            assertTrue(isTrue);
            System.out.println("[TEST] Get all upcoming flights [PASSED]");

    }

    @Test
    @Order(2)
    public void viewAllFlights() {

        List<FlightDTO> flightDTOList = flightService.viewAllFlights();

        boolean isTrue = flightDTOList.size() > 0;

        assertTrue(isTrue);
        System.out.println("[TEST] Get all flights [PASSED]");

    }

}