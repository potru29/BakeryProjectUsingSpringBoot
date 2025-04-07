package com.nexteducation.BakeryProjectusingSpringBoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.BakeryEntity;
@Repository
public interface BakeryRepository extends JpaRepository<BakeryEntity,Integer>{

}
