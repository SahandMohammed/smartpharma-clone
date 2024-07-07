package com.uniq.smartpharma.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.uniq.smartpharma.model.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
