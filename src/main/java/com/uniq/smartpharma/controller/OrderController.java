package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Cart;
import com.uniq.smartpharma.model.CartItem;
import com.uniq.smartpharma.model.Order;
import com.uniq.smartpharma.model.OrderItem;
import com.uniq.smartpharma.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // Display the checkout form
    @GetMapping("/checkout")
    public String showCheckoutForm(Model model) {
        model.addAttribute("order", new Order()); // Assuming Order class has all necessary fields like name, phone, etc.
        return "checkout";
    }

    // Process the checkout form
    @PostMapping("/processCheckout")
    public String processCheckout(@ModelAttribute("order") Order order, HttpSession session, RedirectAttributes redirectAttributes) {
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Your cart is empty!");
            return "redirect:/cart";
        }

        List<OrderItem> orderItems = cart.getItems().stream()
                .map(item -> new OrderItem(item.getDrug(), item.getQuantity(), order))
                .collect(Collectors.toList());

        order.setItems(orderItems);
        orderService.saveOrder(order);

        session.removeAttribute("cart"); // Clear the cart
        redirectAttributes.addFlashAttribute("success", "Order placed successfully!");

        return "redirect:/orders/thank-you";
    }

    // Thank you page after order submission
    @GetMapping("/thank-you")
    public String thankYouPage() {
        return "thank-you"; // Create a thank-you.jsp that shows the thank you message
    }

    // View all orders (for admin)
    @GetMapping("/all")
    public String listOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "orders-list"; // Create an orders-list.jsp to display all orders
    }
}
