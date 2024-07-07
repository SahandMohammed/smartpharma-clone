package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.CartItem;
import com.uniq.smartpharma.model.Order;
import com.uniq.smartpharma.model.OrderItem;
import com.uniq.smartpharma.repository.OrderItemRepository;
import com.uniq.smartpharma.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository; // If you choose to use it

    @Transactional
    public void saveOrder(Order order) {
        // Save the order and its items
        order.getItems().forEach(item -> item.setOrder(order)); // Set the order for each item
        orderRepository.save(order); // This will cascade to the items due to the CascadeType.ALL setting
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Order createOrder(Order order) {
        // Additional logic to handle the creation of an order
        return orderRepository.save(order);
    }

    public Order createOrderFromCart(List<CartItem> cartItems, Order order) {
        List<OrderItem> orderItems = cartItems.stream().map(cartItem -> {
            OrderItem orderItem = new OrderItem();
            orderItem.setDrug(cartItem.getDrug());
            orderItem.setQuantity(cartItem.getQuantity());
            return orderItem;
        }).collect(Collectors.toList());

        orderItems.forEach(order::addItem); // Add each order item to the order

        return orderRepository.save(order); // Save the order along with its items
    }

    public Order findById(Long orderId) {
        return orderRepository.findById(orderId).orElse(null);
    }
}
