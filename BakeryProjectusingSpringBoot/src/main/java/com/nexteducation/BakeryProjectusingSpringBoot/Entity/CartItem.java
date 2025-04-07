package com.nexteducation.BakeryProjectusingSpringBoot.Entity;

public class CartItem {
    private BakeryEntity item;
    private int quantity;

    // Constructor
    public CartItem(BakeryEntity item, int quantity) {
        this.item = item;
        this.quantity = quantity;
    }

    public BakeryEntity getItem() {
        return item;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTotalPrice() {
        return item.getCost() * quantity;
    }
}
