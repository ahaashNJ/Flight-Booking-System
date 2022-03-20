package com.example.universal_travel_company.Model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "airplane")
public class Airplane {

    @Id
    @Column(name = "airplane_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Getter
    @Setter
    private int airplaneId;

    @Column(name = "airplane_name")
    @NotNull(message = "Airplane Name Should Not Be Null")
    @Getter
    @Setter
    private String airplaneName;

    @Column(name = "no_of_seats")
    @NotNull(message = "Number Of Seats Should Not Be Null")
    @Size(min = 100, max = 500, message = "Seat Count Should Be Between 100 to 500")
    @Getter
    @Setter
    private int noOfSeats;

    @Column(name = "costPerSeat")
    @NotNull(message = "Cost of a Seat Should Not Be Null")
    @Getter
    @Setter
    private int costPerSeat;

}
