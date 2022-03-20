package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingRepository extends JpaRepository<Booking, Integer> {
}
