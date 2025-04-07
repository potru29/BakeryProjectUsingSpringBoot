package com.nexteducation.BakeryProjectusingSpringBoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.Admin;

public interface AdminRepo extends JpaRepository<Admin, Integer> {
	Admin findByNameAndPassword(String name, String password);
}
