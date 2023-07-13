package com.example.doan_01.mvc.service;

import com.example.doan_01.mvc.dto.ProductDto;
import com.example.doan_01.mvc.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {
    List<ProductDto> findAll();
//    List<ProductDto> allProduct();
    Product save(MultipartFile imageProduct, ProductDto productDto);
    Product update(MultipartFile imageProduct,ProductDto productDto);
    void deleteById(Long id);
    void enableById(Long id);
    ProductDto getById(Long id);

    Page<Product> getAllProduct(Pageable pageable);
    Page<Product> getProductsByName(String searchInput, Pageable pageable);


}
