package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.User;
import com.uniq.smartpharma.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User authenticate(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user; // Return the full user object
        }
        return null;
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean register(User user) {
        if (userRepository.findByEmail(user.getEmail()) != null) {
            return false; // User with this email already exists
        }
        userRepository.save(user);
        return true;
    }
}
