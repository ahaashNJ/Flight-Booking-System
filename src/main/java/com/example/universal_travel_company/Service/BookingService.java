package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.BookingDTO;
import com.example.universal_travel_company.Model.Booking;
import com.example.universal_travel_company.Repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    //Place a booking using flight and user
    public Booking placeBooking(BookingDTO bookingDTO) {
        Booking booking = new Booking();

        System.out.println(bookingDTO.getFlight());
        booking.setFlight(bookingDTO.getFlight());
        booking.setUser(bookingDTO.getUser());
        booking.setApproveStatus("No");
        booking.setNoOfSeats(bookingDTO.getRequiredSeats());
        int seats = bookingDTO.getRequiredSeats();
        int price = bookingDTO.getFlight().getAirplane().getCostPerSeat();
        booking.setTotalPrice(seats*price);

        return bookingRepository.save(booking);
    }
}
