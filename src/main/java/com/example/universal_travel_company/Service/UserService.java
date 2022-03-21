package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.Authentication.DirectUser;
import com.example.universal_travel_company.DTO.UserDTO;
import com.example.universal_travel_company.Model.User;
import com.example.universal_travel_company.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;


    //Credentials for Login Authentication
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findUserByEmail(email);
        if(user==null){
            throw new UsernameNotFoundException(email);
        }
        else{
            ArrayList<SimpleGrantedAuthority> grantedAuthorities = new ArrayList<>();
            grantedAuthorities.add(new SimpleGrantedAuthority(user.getUserType().toUpperCase(Locale.ROOT)));
            DirectUser directUser = new DirectUser(grantedAuthorities, user.getEmail(), user.getPassword(),
                    true, true, true, true);
            return directUser;
        }
    }

    //Find User by email address
    public User directUserType(String email){
        return userRepository.findUserByEmail(email);
    }

    //Add a user to the system
    public User createUser(UserDTO userdto) throws Exception {
        User user = new User();

        if(userdto!=null){
            if(userRepository.findById(userdto.getEmail()).isPresent()){
                return null;
            }

            user.setPassword(passwordEncoder.encode(userdto.getPassword()));
            user.setEmail(userdto.getEmail());
            user.setFirstName(userdto.getFirstName());
            user.setLastName(userdto.getLastName());
            user.setContactNumber(userdto.getContactNumber().toString());
            user.setUserType("Traveler");
            user.setApproveStatus("Yes");
        }
        else{
            throw new Exception("User Details Were Not Added");
        }

        return userRepository.save(user);
    }

}
