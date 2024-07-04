package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.User;
import com.uniq.smartpharma.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean authenticate(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            System.out.println("Retrieved user: " + user.getUsername());
            System.out.println("Stored password: " + user.getPassword());
            System.out.println("Provided password: " + password);
            if (user.getPassword().equals(password)) {
                System.out.println("Authentication successful for user: " + email);
                return true;
            }
        }
        System.out.println("Authentication failed for user: " + email);
        return false;
    }

    public boolean register(User user) {
        if (userRepository.findByEmail(user.getEmail()) != null) {
            return false; // User already exists
        }
        userRepository.save(user);
        return true;
    }
}
