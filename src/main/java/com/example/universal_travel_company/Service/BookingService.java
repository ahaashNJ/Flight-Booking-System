package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.BookingDTO;
import com.example.universal_travel_company.DTO.FlightDTO;
import com.example.universal_travel_company.Model.Booking;
import com.example.universal_travel_company.Model.Flight;
import com.example.universal_travel_company.Repository.BookingRepository;
import com.example.universal_travel_company.Repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private FlightRepository flightRepository;

    //Place a booking using flight and user
    public Booking placeBooking(BookingDTO bookingDTO) throws Exception {
        Booking booking = new Booking();

        if(booking!=null){
            System.out.println(bookingDTO.getFlight());
            booking.setFlight(bookingDTO.getFlight());
            booking.setUser(bookingDTO.getUser());
            booking.setApproveStatus("No");
            booking.setNoOfSeats(bookingDTO.getRequiredSeats());
            int seats = bookingDTO.getRequiredSeats();
            int price = bookingDTO.getFlight().getAirplane().getCostPerSeat();
            booking.setTotalPrice(seats*price);


        }
        else{
            throw new Exception("Could Not Add Data To The System");
        }
        return bookingRepository.save(booking);
    }

    public List<BookingDTO> getALlBookings(){
        List<Booking> BookingList = bookingRepository.findAll();

        List<BookingDTO> bookingDTOS = new ArrayList<>();

        if (BookingList != null) {
            for (Booking booking : BookingList) {
                BookingDTO bookingDTO = new BookingDTO();
                bookingDTO.setBookingId(booking.getBookingId());
                bookingDTO.setRequiredSeats(booking.getNoOfSeats());
                bookingDTO.setApproveStatus(booking.getApproveStatus());
                bookingDTO.setTotalPrice(booking.getTotalPrice());
                bookingDTO.setUser(booking.getUser());
                bookingDTO.setFlight(booking.getFlight());
                bookingDTOS.add(bookingDTO);
            }
        }
        return bookingDTOS;
    }
}
