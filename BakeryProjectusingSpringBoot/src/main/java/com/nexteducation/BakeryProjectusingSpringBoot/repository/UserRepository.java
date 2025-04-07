package com.nexteducation.BakeryProjectusingSpringBoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nexteducation.BakeryProjectusingSpringBoot.Entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	UserEntity findByUsernameAndPassword(String username, String password);
    UserEntity findByUsername(String username);

}
