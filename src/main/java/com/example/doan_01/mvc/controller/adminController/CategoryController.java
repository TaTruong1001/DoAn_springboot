package com.example.doan_01.mvc.controller.adminController;

import com.example.doan_01.mvc.model.Category;
import com.example.doan_01.mvc.service.Impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
public class CategoryController {

    @Autowired
    CategoryServiceImpl categoryService;

    @RequestMapping(value = "categories", method = RequestMethod.GET)
    public String category(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        List<Category> categoryList = categoryService.findALl();
        model.addAttribute("categories", categoryList);
        model.addAttribute("size", categoryList.size());
        model.addAttribute("title", "Category");
        model.addAttribute("categoryNew", new Category());
        return "/categories";
    }

    @RequestMapping(value = "save-category", method = RequestMethod.POST)
    public String addCategory(@ModelAttribute("categoryNew") Category category, Model model) {
        try {
            categoryService.save(category);
            model.addAttribute("success", "Add successfully!");
        } catch (DataIntegrityViolationException exception) {
            exception.printStackTrace();
            model.addAttribute("error", "Duplicate name of category, please check again!");
        } catch (Exception exception1) {
            exception1.printStackTrace();
            model.addAttribute("categoryNew", category);
            model.addAttribute("error", "Error server");
        }
        return "redirect:/categories";
    }


    @RequestMapping(value = "/findById", method = RequestMethod.GET)
    @ResponseBody
    public Optional<Category> findById(Long id) {
        return categoryService.findById(id);

    }
    @RequestMapping(value = "update-category", method = RequestMethod.GET)
    public String updateCategory(@ModelAttribute Category category, Model model){
        try {
            categoryService.update(category);
            model.addAttribute("success", "Update successfully!");
        }catch (DataIntegrityViolationException e1) {
            e1.printStackTrace();
            model.addAttribute("error", "Duplicate name of category, please check again!");
        } catch (Exception e2) {
            e2.printStackTrace();
            model.addAttribute("error", "Error from server or duplicate name of category, please check again!");
        }
        return "redirect:/categories";
    }
    @RequestMapping(value = "/delete-category", method = RequestMethod.GET)
    public String deleteCaterogy(Model model, Long id){
        try {
            categoryService.deleteById(id);
            model.addAttribute("success", "Deleted successfully!");
        }catch (DataIntegrityViolationException e1){
            e1.printStackTrace();
             model.addAttribute("error", "Duplicate name of category, please check again!");
        }catch (Exception e2){
            e2.printStackTrace();
            model.addAttribute("error", "Error server");
        }
        return "redirect:/categories";
    }
  @RequestMapping(value = "enable-category", method = RequestMethod.GET)
  public String enableCategory(Long id,Model model){
      try {
          categoryService.enableById(id);
          model.addAttribute("success", "Deleted successfully!");
      }catch (DataIntegrityViolationException e1){
          e1.printStackTrace();
          model.addAttribute("error", "Duplicate name of category, please check again!");
      }catch (Exception e2){
          e2.printStackTrace();
          model.addAttribute("error", "Error server");
      }
      return "redirect:/categories";
  }
}
