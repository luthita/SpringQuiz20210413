package com.luthita.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.luthita.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
}
