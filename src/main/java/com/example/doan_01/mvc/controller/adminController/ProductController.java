package com.example.doan_01.mvc.controller.adminController;

import com.example.doan_01.mvc.dto.ProductDto;
import com.example.doan_01.mvc.model.Category;
import com.example.doan_01.mvc.model.Product;
import com.example.doan_01.mvc.repository.ProductRepository;
import com.example.doan_01.mvc.service.CategoryService;
import com.example.doan_01.mvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductRepository productRepository;

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String product(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        List<ProductDto> productDtoList = productService.findAll();
        model.addAttribute("products", productDtoList);
        model.addAttribute("size", productDtoList.size());
        return "products";
    }
    @RequestMapping(value = "/products/{pageNo}",method = RequestMethod.GET)
    public String prodcutPage(@PathVariable("pageNo") int pageNo, Model model, Principal principal){
        if (principal == null) {
            return "redirect:/login";
        }
        Page<Product> products = productService.pageProduct(pageNo);
        model.addAttribute("title", "Manage Products");
        model.addAttribute("size", products.getSize());
        model.addAttribute("products", products);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", products.getTotalPages());
        return "products";
    }

    @RequestMapping(value = "/add-product", method = RequestMethod.GET)
    private String addProduct(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        List<Category> categories = categoryService.findAllByActivatedTrue();
        model.addAttribute("categories", categories);
        model.addAttribute("title", "add product");
        model.addAttribute("product", new ProductDto());
        return "/add-product";
    }

    @RequestMapping(value = "save-product", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("productDto") ProductDto productDto,
                              @RequestParam("imageProduct") MultipartFile imageProduct,
                              Model model) {
        try {

            productService.save(imageProduct, productDto);
            model.addAttribute("success", "Add new product successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Failed to add new product!");
        }
        return "redirect:/products";
    }

    @RequestMapping(value = "update-product/{id}", method = RequestMethod.GET)
    public String updateProduct(@PathVariable("id") Long id, Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        List<Category> categories = categoryService.findAllByActivatedTrue();
        ProductDto productDto = productService.getById(id);
        model.addAttribute("products", productDto);
        model.addAttribute("categories", categories);
        return "update-product";
    }
    @RequestMapping(value = "update-product/{id}", method = RequestMethod.POST)
    public String saveUpdateProduct(@ModelAttribute("products") ProductDto productDto,
            @RequestParam("imageProduct") MultipartFile imageProduct, Model model){
        try {
            productService.update(imageProduct, productDto);
            model.addAttribute("success", "Update successfully!");
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("error", "Error server, please try again!");
        }
       return "redirect:/products";
     }
     @RequestMapping(value = "enable-product/{id}", method = RequestMethod.GET)
    public String enableProduct(@PathVariable("id") Long id, Model model){
        try {
            productService.enableById(id);
            model.addAttribute("success", "Enable successfully!");
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("error", "Failld to enable!");
        }
        return "redirect:/products";
    }
    @RequestMapping(value = "delete-product/{id}", method = RequestMethod.GET)
    public String deleteproduct(@PathVariable("id") Long id, Model model){
        try {
            productService.deleteById(id);
            model.addAttribute("success", "Delee successfully!");
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("error", "Failld to delete!");
        }
        return "redirect:/products";
    }
}
