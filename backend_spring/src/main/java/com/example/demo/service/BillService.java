package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.model.Bill;
import com.example.demo.repository.BillRepository;
import com.example.demo.security.AesUtil;

@Service
public class BillService {

    private final BillRepository billRepo;
    private final AesUtil aesUtil;

    public BillService(BillRepository repo, AesUtil aesUtil) {
        this.billRepo = repo;
        this.aesUtil = aesUtil;
    }

    public Bill createBill(Bill bill) {
        bill.setEncryptedNote(aesUtil.encrypt(bill.getEncryptedNote()));
        return billRepo.save(bill);
    }

    public List<Bill> getAllBills() {
        return billRepo.findAll();
    }

   
    public Optional<Bill> getBill(Long id) {
        return billRepo.findById(id);
    }

    public Bill markAsPaid(Long id) {
        Bill bill = billRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Bill not found"));

        bill.setPaid(true);
        return billRepo.save(bill);
    }
}
