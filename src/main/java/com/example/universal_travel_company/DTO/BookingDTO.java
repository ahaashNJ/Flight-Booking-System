package com.example.universal_travel_company.DTO;

import com.example.universal_travel_company.Model.Airplane;
import com.example.universal_travel_company.Model.Flight;
import com.example.universal_travel_company.Model.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
public class BookingDTO {

    @Getter
    @Setter
    private Integer bookingId;

    @Getter
    @Setter
    private Integer requiredSeats;

    @Getter
    @Setter
    private Integer totalPrice;

    @Getter
    @Setter
    private User user;

    @Getter
    @Setter
    private Flight flight;

    @Getter
    @Setter
    private String approveStatus;

}
