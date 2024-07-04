package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.User;
import com.uniq.smartpharma.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        boolean authenticated = userService.authenticate(user.getEmail(), user.getPassword());
        if (authenticated) {
            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password");
            return "redirect:/login";
        }
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        boolean registered = userService.register(user);
        if (registered) {
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "Registration failed");
            return "redirect:/register";
        }
    }
}
