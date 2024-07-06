package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Drug;
import com.uniq.smartpharma.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class DrugController {

    @Autowired
    private DrugService drugService;

    // Search Form
    @GetMapping("/drugs/search")
    public String searchDrugs(@RequestParam("query") String query, Model model) {
        List<Drug> drugs = drugService.searchDrugs(query);
        model.addAttribute("drugs", drugs);
        return "drugs/search"; // This resolves to /WEB-INF/views/drugs/search.jsp
    }

    // Drug Details
    @GetMapping("/drugs/druginfo")
    public String drugInfo(@RequestParam("id") Long id, Model model) {
        Drug drug = drugService.findDrugById(id);
        model.addAttribute("drug", drug);
        return "drugs/druginfo";
    }

    @GetMapping("/drugs/suggestions")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> autocompleteDrugs(@RequestParam("query") String query) {
        if (query == null || query.trim().isEmpty()) {
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(Collections.emptyList());
        }
        List<Drug> drugs = drugService.searchDrugs(query.trim());
        List<Map<String, Object>> results = drugs.stream().map(drug -> {
            Map<String, Object> map = new HashMap<>();
            map.put("id", drug.getId());
            map.put("name", drug.getName());
            return map;
        }).collect(Collectors.toList());
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(results);
    }
}
