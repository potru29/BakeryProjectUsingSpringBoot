package com.nexteducation.BakeryProjectusingSpringBoot.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.Admin;
import com.nexteducation.BakeryProjectusingSpringBoot.repository.AdminRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminRepo adminRepo;

    @GetMapping("/adminlogin")
    public String adminLogin() {
        return "adminlogin";
    }

    @PostMapping("/adminlogin")
    public String validateAdmin(@RequestParam String name,
                                @RequestParam String password,
                                HttpSession session,
                                Model model) {
        Admin admin = adminRepo.findByNameAndPassword(name, password);
        if(admin != null) {
            session.setAttribute("adminObj", admin);
            return "redirect:/admin"; 
        } else {
            model.addAttribute("error", "Invalid Credentials");
            return "adminlogin";
        }
    }

    @GetMapping("/adminregister")
    public String adminRegister() {
        return "adminregister";
    }

    @PostMapping("/adminregister")
    public String saveAdmin(@ModelAttribute Admin admin) {
        adminRepo.save(admin);
        return "redirect:/adminlogin";
    }

    @GetMapping("/adminlogout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/adminlogin";
    }
}
