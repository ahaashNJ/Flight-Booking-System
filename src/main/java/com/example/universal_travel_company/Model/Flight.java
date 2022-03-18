package com.example.universal_travel_company.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Time;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "flight")
public class Flight {

    @Id
    @Column(name = "flightId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int flightId;

    @Column(name = "from_location")
    @NotNull(message = "From Location Cannot Be Null")
    @Getter
    @Setter
    private String fromLocation;

    @Column(name = "to_location")
    @NotNull(message = "To Location Cannot Be Null")
    @Getter
    @Setter
    private String toLocation;

    @Column(name = "flight_date")
    @NotNull(message = "Flight Date Cannot Be Null")
    @Getter
    @Setter
    private Date date;

    @Column(name = "flight_time")
    @NotNull(message = "Flight Time Cannot Be Null")
    @Getter
    @Setter
    private Time time;

    @Column(name = "no_of_seats")
    @NotNull(message = "No Of Seats Cannot Be Null")
    @Getter
    @Setter
    private int noOfSeats;

    @ManyToOne
    @JoinColumn(name = "user_email")
    @Setter
    @Getter
    private User user;

    @ManyToOne
    @JoinColumn(name = "airplane_id")
    @Setter
    @Getter
    private Airplane airplane;

}
