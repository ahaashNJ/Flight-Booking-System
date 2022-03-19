package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.Airplane;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AirplaneRepository extends JpaRepository<Airplane,Integer> {
}
