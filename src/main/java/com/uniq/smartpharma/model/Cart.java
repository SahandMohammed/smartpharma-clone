package com.uniq.smartpharma.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        this.items.add(item);
    }


    public void updateItem(Long drugId, int quantity) {
        for (CartItem item : items) {
            if (item.getDrug().getId().equals(drugId)) {
                item.setQuantity(quantity);
                break;
            }
        }
    }

    public int getSize() {
        return items.stream().mapToInt(CartItem::getQuantity).sum();
    }

    public void addItem(Drugs drug, int quantity) {
        // Check if the item is already in the cart
        Optional<CartItem> existingItem = items.stream().filter(item -> item.getDrug().getId().equals(drug.getId())).findFirst();

        if (existingItem.isPresent()) {
            // If the item is already in the cart, just update the quantity
            CartItem cartItem = existingItem.get();
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        } else {
            // If the item is not in the cart, add a new CartItem
            items.add(new CartItem(drug, quantity));
        }
    }

    public void removeItem(Long drugId) {
        items.removeIf(item -> item.getDrug().getId().equals(drugId));
    }

    public double getTotalCost() {
        return items.stream().mapToDouble(item -> item.getQuantity() * item.getDrug().getPrice()).sum();
    }
}

