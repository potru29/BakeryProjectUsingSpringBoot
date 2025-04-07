package com.nexteducation.BakeryProjectusingSpringBoot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.BakeryEntity;
import com.nexteducation.BakeryProjectusingSpringBoot.repository.BakeryRepository;
import com.nexteducation.BakeryProjectusingSpringBoot.service.BakeryService;
@Service
public class BakeryServiceImpl implements BakeryService{
	@Autowired
	private BakeryRepository repository;
	@Override
	public void addItem(BakeryEntity item) {
		repository.save(item);
		
	}
	@Override
	public List<BakeryEntity> getAllItems() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	@Override
	public BakeryEntity getItemById(int id) {
		// TODO Auto-generated method stub
		return repository.findById(id).orElse(null);
	}
	@Override
	public void updateItem(BakeryEntity item) {
		// TODO Auto-generated method stub
		repository.save(item);
	}
	@Override
	public void deleteIntem(int id) {
		repository.deleteById(id);
		
	}

}
