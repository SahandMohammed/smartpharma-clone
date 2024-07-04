package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Drug;
import com.uniq.smartpharma.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
}
