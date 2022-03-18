package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,String> {
}
