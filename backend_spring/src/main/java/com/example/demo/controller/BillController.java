
package com.example.demo.controller;


import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Bill;
import com.example.demo.service.BillService;

@RestController
@RequestMapping("/api/bills")
@CrossOrigin("*")
public class BillController {

    private final BillService billService;

    public BillController(BillService billService) {
        this.billService = billService;
    }

    // GET all bills
    @GetMapping
    public List<Bill> getBills() {
        return billService.getAllBills();
    }

    // POST new bill
    @PostMapping
    public Bill create(@RequestBody Bill bill) {
        return billService.createBill(bill);
    }

    // POST to pay a bill
    @PostMapping("/{id}/pay")
    public Bill payBill(@PathVariable Long id) {
        return billService.markAsPaid(id);
    }
}