package com.example.universal_travel_company.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "Booking")
public class Booking {

    @Id
    @Column(name = "bookingId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int bookingId;

    @Column(name = "total_price")
    @Getter
    @Setter
    private int totalPrice;

    @Column(name = "no_of_seats")
    @Getter
    @Setter
    private int noOfSeats;

    @ManyToOne
    @JoinColumn(name = "flight_id")
    @Setter
    @Getter
    private Flight flight;

    @ManyToOne
    @JoinColumn(name = "user_email")
    @Setter
    @Getter
    private User user;

    @Column(name = "approve_status")
    @Getter
    @Setter
    private String approveStatus;
}
