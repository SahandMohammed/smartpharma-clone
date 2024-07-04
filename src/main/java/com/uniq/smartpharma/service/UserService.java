package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    public boolean authenticate(String username, String password) {
        // Authentication logic (mock)
        return "admin".equals(username) && "pass".equals(password);
    }

    public boolean register(User user) {
        // Registration logic (mock)
        // Ideally, you'd save the user to a database here
        return true;
    }
}
