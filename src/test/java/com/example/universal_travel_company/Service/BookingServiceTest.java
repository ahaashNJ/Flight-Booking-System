package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.BookingDTO;
import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Model.Booking;
import com.example.universal_travel_company.Model.Flight;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@SpringBootTest
public class BookingServiceTest {

    @Autowired
    private BookingService bookingService;

    private int addedBooking;

    @Test
    @Order(1)
    public void viewAllBookings() {

        List<BookingDTO> bookingDTOS = bookingService.getALlBookings();

        boolean isTrue = bookingDTOS.size() > 0;

        assertTrue(isTrue);
        System.out.println("[TEST] Get all Bookings [PASSED]");

    }
}