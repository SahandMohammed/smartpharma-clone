package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Cart;
import com.uniq.smartpharma.model.CartItem;
import com.uniq.smartpharma.model.Drugs;
import com.uniq.smartpharma.service.DrugService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class DrugController {

    @Autowired
    private DrugService drugService;

    @ModelAttribute("cart")
    public Cart iniCart() {
        return new Cart();
    }

    // Example to ensure Cart is available in the model across requests
    @ModelAttribute("cart")
    public Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @ModelAttribute("cart")
    public Cart prepareCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }


    // Search Form
    @GetMapping("/drugs/search")
    public String searchDrugs(@RequestParam("query") String query, Model model) {
        List<Drugs> drugs = drugService.searchDrugs(query);
        model.addAttribute("drugs", drugs);
        return "drugs/search"; // This resolves to /WEB-INF/views/drugs/search.jsp
    }

    // Drug Details
    @GetMapping("/drugs/druginfo")
    public String drugInfo(@RequestParam("id") Long id, Model model) {
        Drugs drug = drugService.findDrugById(id);
        model.addAttribute("drug", drug);
        return "drugs/druginfo";
    }

    @GetMapping("/drugs/suggestions")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> autocompleteDrugs(@RequestParam("query") String query) {
        if (query == null || query.trim().isEmpty()) {
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(Collections.emptyList());
        }
        List<Drugs> drugs = drugService.searchDrugs(query.trim());
        List<Map<String, Object>> results = drugs.stream().map(drug -> {
            Map<String, Object> map = new HashMap<>();
            map.put("id", drug.getId());
            map.put("name", drug.getName());
            return map;
        }).collect(Collectors.toList());
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(results);
    }

    @PostMapping("/add-to-cart")
    public ResponseEntity<String> addToCart(@RequestParam("id") Long drugId, @RequestParam("quantity") int quantity, HttpSession session) {
        // Assuming you have a Cart class that handles the logic of adding items
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        Drugs drug = drugService.findDrugById(drugId);
        if (drug != null) {
            cart.addItem(drug, quantity); // Simplified method to add items to the cart
            return ResponseEntity.ok("Item added to cart successfully");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Item could not be added");
    }

    @GetMapping("/cart")
    public String showCart(Model model, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            System.out.println("Cart is empty");
        } else {
            System.out.println("Cart has " + cart.getItems().size() + " items");
        }
        model.addAttribute("cart", cart);
        return "cart";
    }

    @GetMapping("/checkout")
    public String checkout(SessionStatus status) {
        status.setComplete(); // Clear the session attribute named 'cart'
        return "redirect:/";
    }

    @PostMapping("/update-cart")
    public String updateCartItem(@RequestParam("id") Long id, @RequestParam("quantity") int quantity, @ModelAttribute("cart") Cart cart, RedirectAttributes redirectAttributes) {
        cart.updateItem(id, quantity); // Assume `updateItem` is a method in the Cart class that updates the quantity
        return "redirect:/cart";
    }

    @GetMapping("/remove-from-cart")
    public String removeFromCart(@RequestParam("id") Long id, @ModelAttribute("cart") Cart cart) {
        cart.removeItem(id); // Assume `removeItem` is a method in the Cart class that removes the item by id
        return "redirect:/cart";
    }
}
