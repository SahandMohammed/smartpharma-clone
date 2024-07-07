package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Drugs;
import com.uniq.smartpharma.service.DrugService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.uniq.smartpharma.service.AdminService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private DrugService drugService;

    @GetMapping("/admin-dashboard")
    public String adminDashboard(Model model) {
        return "/admin/admin-dashboard";
    }

    @GetMapping("/drugs")
    public String listDrugs(Model model) {
        List<Drugs> allDrugs = drugService.getAllDrugs();
        System.out.println("Fetched " + allDrugs.size() + " drugs.");  // Log the number of drugs fetched
        model.addAttribute("drugs", allDrugs);
        return "admin/drugs";
    }

    @GetMapping("/drugs/add")
    public String showAddDrugForm(Model model) {
        model.addAttribute("drug", new Drugs());
        return "admin/add-drug";
    }

    @PostMapping("/drugs/add")
    public String addDrug(@ModelAttribute("drug") Drugs drug, RedirectAttributes redirectAttributes) {
        drugService.saveDrug(drug);
        redirectAttributes.addFlashAttribute("message", "Drug added successfully!");
        return "redirect:/admin/drugs";
    }

    @GetMapping("/drugs/edit/{id}")
    public String showEditDrugForm(@PathVariable Long id, Model model) {
        Drugs drug = drugService.findDrugById(id);
        model.addAttribute("drug", drug);
        return "admin/admin-edit-drug";
    }

    @PostMapping("/drugs/update")
    public String updateDrug(@ModelAttribute("drug") Drugs drug) {
        drugService.saveDrug(drug);
        return "redirect:admin/drugs";
    }

    @GetMapping("/drugs/delete/{id}")
    public String deleteDrug(@PathVariable Long id) {
        drugService.deleteDrugById(id);
        return "redirect:admin/drugs";
    }
}
