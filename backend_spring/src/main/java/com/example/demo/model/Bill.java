package com.example.demo.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;
    private String cardLast4;

    private BigDecimal amountDue;

    private LocalDate dueDate;

    private String category;

    private boolean paid;

    // sensitive field — will store encrypted text
    private String encryptedNote;

    public Bill() {}

    public Bill(Long userId, String cardLast4, BigDecimal amountDue, LocalDate dueDate, String category, boolean paid, String encryptedNote) {
        this.userId = userId;
        this.cardLast4 = cardLast4;
        this.amountDue = amountDue;
        this.dueDate = dueDate;
        this.category = category;
        this.paid = paid;
        this.encryptedNote = encryptedNote;
    }

    // --- getters & setters ---

    public Long getId() { return id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public String getCardLast4() { return cardLast4; }
    public void setCardLast4(String cardLast4) { this.cardLast4 = cardLast4; }

    public BigDecimal getAmountDue() { return amountDue; }
    public void setAmountDue(BigDecimal amountDue) { this.amountDue = amountDue; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public boolean isPaid() { return paid; }
    public void setPaid(boolean paid) { this.paid = paid; }

    public String getEncryptedNote() { return encryptedNote; }
    public void setEncryptedNote(String encryptedNote) { this.encryptedNote = encryptedNote; }
}
