package com.luthita.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luthita.lesson04.dao.SellerDAO;
import com.luthita.lesson04.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public void insertSeller(String nickname, String profileImageUrl, double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSeller() {
		return sellerDAO.getLastSeller();
	}
	
	public Seller getLastSellerById(int id) {
		return sellerDAO.getLastSellerById(id);
	}
}
