package com.uniq.smartpharma.service;

import com.uniq.smartpharma.model.Drugs;
import com.uniq.smartpharma.repository.DrugRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class DrugService {

    private final DrugRepository drugRepository;

    @Autowired
    public DrugService(DrugRepository drugRepository) {
        this.drugRepository = drugRepository;
    }

    public List<Drugs> searchDrugs(String search) {
        if (search == null || search.trim().isEmpty()) {
            // Return empty list if search is null or empty
            return Collections.emptyList();
        }
        return drugRepository.findByNameStartingWithIgnoreCase(search.toLowerCase());
    }

    // In DrugService.java
    public List<String> getSuggestions(String query) {
        return drugRepository.findNameByQuery(query + "%").stream().limit(10)  // limit the suggestions to 10
                .collect(Collectors.toList());
    }


    public Drugs findDrugById(Long id) {
        return drugRepository.findById(id).orElse(null);
    }

    // Add or update a drug
    public Drugs saveDrug(Drugs drug) {
        return drugRepository.save(drug);
    }

    // Delete a drug by ID
    public void deleteDrugById(Long id) {
        drugRepository.deleteById(id);
    }

    // Fetch all drugs
    public List<Drugs> getAllDrugs() {
        return drugRepository.findAll();
    }

}
