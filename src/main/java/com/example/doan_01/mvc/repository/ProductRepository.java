package com.example.doan_01.mvc.repository;

import com.example.doan_01.mvc.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> getByNameContaining(String searchInput, Pageable pageable);
    Page<Product> findAll(Pageable pageable);

}
