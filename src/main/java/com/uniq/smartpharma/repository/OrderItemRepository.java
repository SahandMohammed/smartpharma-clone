package com.uniq.smartpharma.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.uniq.smartpharma.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    // Any specific methods for querying OrderItems can be defined here
}
