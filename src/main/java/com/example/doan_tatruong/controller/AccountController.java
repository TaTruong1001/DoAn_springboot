package com.example.doan_tatruong.controller;

import com.example.doan_tatruong.model.User;
import com.example.doan_tatruong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
public class AccountController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "customer/account",method = RequestMethod.GET)
    public String accountHome(Model model, Principal principal){
        if (principal == null){
            return "redirect:/login";
        }
        String username = principal.getName();
        User user = userService.findByUsername(username);

        model.addAttribute("user", user);

        return "account";
    }
    @RequestMapping(value = "customer/update-info", method = {RequestMethod.PUT,RequestMethod.GET})
    public String updateUser(Model model, Principal principal,
                             @ModelAttribute("user") User user, RedirectAttributes attributes){
        if (principal == null){
            return "redirect:/login";
        }
        User userSaved = userService.saveInfo(user);
        attributes.addFlashAttribute("user", userSaved);
        return "redirect:/account";
    }
    @RequestMapping(value = "customer/profile", method = RequestMethod.GET)
    public String profile(Principal principal, Model model){
        if (principal == null){
            return "redirect:/login";
        }
        String username = principal.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        return "my-account";
    }
}
