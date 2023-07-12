package com.example.doan_01.mvc.service;


import com.example.doan_01.mvc.dto.AdminDto;
import com.example.doan_01.mvc.model.Admin;

public interface AdminService {
    Admin findByUsername(String username);
    Admin save(AdminDto adminDto);
}
