package com.uniq.smartpharma.model;

public class CartItem {
    private Drugs drug;
    private int quantity;

    public CartItem(Drugs drug, int quantity) {
        this.drug = drug;
        this.quantity = quantity;
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

    public double getTotalPrice() {
        return this.quantity * this.drug.getPrice();
    }
}
