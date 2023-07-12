package com.example.doan_01.mvc.repository;

import com.example.doan_01.mvc.dto.CategoryDto;
import com.example.doan_01.mvc.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    @Query(value = "select * from categories where is_activated = true", nativeQuery = true)
    List<Category> findAllByActivatedTrue();

    @Query(value = "select new com.example.doan_01.mvc.dto.CategoryDto(c.id, c.name, count(p.category.id)) " +
            "from Category c left join Product p on c.id = p.category.id " +
            "where c.activated = true and c.deleted = false " +
            "group by c.id ")
    List<CategoryDto> getCategoriesAndSize();
}
