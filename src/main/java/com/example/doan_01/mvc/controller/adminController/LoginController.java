package com.example.doan_01.mvc.controller.adminController;

import com.example.doan_01.mvc.dto.AdminDto;
import com.example.doan_01.mvc.model.Admin;
import com.example.doan_01.mvc.service.Impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LoginController {
    @Autowired
    AdminServiceImpl adminServiceImpl;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    @GetMapping("/login")
    public String loginForm(Model model){
        model.addAttribute("title", "Login Page");
        return "login";
    }

    @RequestMapping(value = "admin/index", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("title", "Home Page");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication ==null || authentication instanceof AnonymousAuthenticationToken){
            return "redirect:/login";
        }
        return "index";
    }
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(Model model){
        model.addAttribute("title", "Register");
        model.addAttribute("adminDto", new AdminDto());
        return "register";
    }

    @RequestMapping(value = "register-new", method = RequestMethod.POST)
    public String newRegister(@ModelAttribute("adminDto") AdminDto adminDto, BindingResult result,
                              Model model){

        try {

            if (result.hasErrors()) {
                model.addAttribute("adminDto", adminDto);
                result.toString();
                return "register";
            }
            String username = adminDto.getUsername();
            Admin admin = adminServiceImpl.findByUsername(username);
            if (admin != null) {
                model.addAttribute("adminDto", adminDto);
                System.out.println("admin not null");
                model.addAttribute("emailError", "Your email has been registered!");
                return "register";
            }
            if (adminDto.getPassword().equals(adminDto.getRepeatPassword())) {
                adminDto.setPassword(passwordEncoder.encode(adminDto.getPassword()));
                adminServiceImpl.save(adminDto);
                System.out.println("success");
                model.addAttribute("success", "Register successfully!");
                model.addAttribute("adminDto", adminDto);
            } else {
                model.addAttribute("adminDto", adminDto);
                model.addAttribute("passwordError", "Your password maybe wrong! Check again!");
                System.out.println("password not same");
                return "register";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "The server has been wrong!");
        }
        return "register";

    }

    @RequestMapping(value = "forgot-password", method = RequestMethod.GET)
    public String forgotPassword(Model model){

        model.addAttribute("title", "Forgot Password");
        return "forgot-password";
    }

}
