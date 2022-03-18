package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightRepository extends JpaRepository<Flight,Integer> {
}
