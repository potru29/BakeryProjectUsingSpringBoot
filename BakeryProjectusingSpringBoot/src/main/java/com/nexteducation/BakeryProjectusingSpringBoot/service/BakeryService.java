package com.nexteducation.BakeryProjectusingSpringBoot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.BakeryEntity;
import com.nexteducation.BakeryProjectusingSpringBoot.repository.BakeryRepository;

public interface BakeryService {
	void addItem(BakeryEntity item);
	List<BakeryEntity> getAllItems();
	BakeryEntity getItemById(int id);
	void updateItem(BakeryEntity item);
	void deleteIntem(int id);
	List<BakeryEntity> searchBakeryItems(String keyword);

}
