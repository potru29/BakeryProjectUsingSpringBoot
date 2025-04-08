package com.nexteducation.BakeryProjectusingSpringBoot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.BakeryEntity;
@Repository
public interface BakeryRepository extends JpaRepository<BakeryEntity,Integer>{

	@Query("SELECT i FROM BakeryEntity i WHERE i.name LIKE %:keyword% OR CAST(i.cost AS string) LIKE %:keyword% OR i.description LIKE %:keyword%")
	List<BakeryEntity> searchByNameCategoryOrPrice(@Param("keyword") String keyword);

}
