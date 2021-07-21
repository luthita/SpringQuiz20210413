package com.luthita.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.luthita.lesson04.model.Seller;

@Repository
public interface SellerDAO {

	public void insertSeller(
			@Param("nickname") String nickname, 
			@Param("profileImageUrl") String profileImageUrl, 
			@Param("temperature") double temperature);
	
	public Seller getLastSeller();
	
	public Seller getLastSellerById(int id);
}

