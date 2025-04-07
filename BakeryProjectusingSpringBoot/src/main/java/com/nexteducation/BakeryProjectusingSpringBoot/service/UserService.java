package com.nexteducation.BakeryProjectusingSpringBoot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.UserEntity;
import com.nexteducation.BakeryProjectusingSpringBoot.repository.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository repo;

    public String registerUser(UserEntity user) {
        UserEntity existingUser = repo.findByUsername(user.getUsername());
        if(existingUser != null) {
            return "Username already exists!";
        }
        repo.save(user);
        return "Registered Successfully!";
    }

    public boolean loginUser(String username, String password) {
        UserEntity user = repo.findByUsernameAndPassword(username, password);
        return user != null;
    }
}
