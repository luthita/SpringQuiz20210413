package com.luthita.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luthita.lesson03.dao.Real_EstateDAO;
import com.luthita.lesson03.model.Real_Estate;

@Service
public class Real_EstateBO {
	
	@Autowired
	private Real_EstateDAO real_estateDAO;
	
	public Real_Estate getReal_Estate(int id) {
		return real_estateDAO.selectReal_Estate(id) ;
	}
	
	public List<Real_Estate> getReal_EstateListByRentPrice(int rentPrice){
		return real_estateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<Real_Estate> getReal_EstateListByAreaAndPrice(int area, int price){
		return real_estateDAO.selectRealEstateListByAreaAndPrice(area, price);
	}
	
	public int insertReal_Estate(Real_Estate real_estate) {
		return real_estateDAO.insertReal_Estate(real_estate);
	}
	
	public int insertReal_EstateAsField(int realtorId, String address, int area, String type, int price, int rentPrice) {
		return real_estateDAO.insertReal_EstateAsField(realtorId, address, area, type, price, rentPrice);
	}
}
