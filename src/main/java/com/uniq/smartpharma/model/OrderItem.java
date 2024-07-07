package com.uniq.smartpharma.model;

import jakarta.persistence.*;

@Entity
@Table(name = "OrderItems")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Order order;

    @ManyToOne
    private Drugs drug;
    private int quantity;

    public OrderItem(Drugs drug, int quantity, Order order) {
        this.drug = drug;
        this.quantity = quantity;
        this.order = order;
    }

    public OrderItem() {

    }

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Drugs getDrug() {
        return drug;
    }

    public void setDrug(Drugs drug) {
        this.drug = drug;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
