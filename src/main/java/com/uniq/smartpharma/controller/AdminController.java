package com.uniq.smartpharma.controller;

import com.uniq.smartpharma.model.Drugs;
import com.uniq.smartpharma.service.DrugService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
        System.out.println("OTC Status Received: " + drug.isOTC());  // Debugging line
        drugService.saveDrug(drug);
        redirectAttributes.addFlashAttribute("message", "Drug added successfully!");
        return "redirect:/admin/drugs";
    }


    @GetMapping("/drugs/edit/{id}")
    public String showEditDrugForm(@PathVariable("id") Long id, Model model) {
        Drugs drug = drugService.findDrugById(id);
        if (drug != null) {
            model.addAttribute("drug", drug);
            return "/admin/edit-drug";
        } else {
            return "redirect:/admin/drugs";
        }
    }

    // Method to process the form submission
    @PostMapping("/drugs/update")
    public String updateDrug(@ModelAttribute("drug") Drugs drug, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        System.out.println("Received isOTC: " + request.getParameter("isOTC")); // Check raw parameter value
        System.out.println("Drug object isOTC before set: " + drug.isOTC());

        // Explicitly set isOTC based on parameter
        drug.setOTC(Boolean.parseBoolean(request.getParameter("isOTC")));
        System.out.println("Drug object isOTC after set: " + drug.isOTC());

        drugService.saveDrug(drug);
        redirectAttributes.addFlashAttribute("message", "Drug updated successfully!");
        return "redirect:/admin/drugs";
    }


    @GetMapping("/drugs/delete/{id}")
    public String deleteDrug(@PathVariable("id") Long id) {
        drugService.deleteDrugById(id);
        return "redirect:/admin/drugs";
    }
}
