package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.Drug;
import com.uniq.smartpharma.repository.DrugRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DrugService {

    private final DrugRepository drugRepository;

    @Autowired
    public DrugService(DrugRepository drugRepository) {
        this.drugRepository = drugRepository;
    }

    public List<Drug> searchDrugs(String search) {
        return drugRepository.findByNameContainingIgnoreCase(search);
    }

    public Drug findDrugById(Long id) {
        return drugRepository.findById(id).orElse(null);
    }
}
