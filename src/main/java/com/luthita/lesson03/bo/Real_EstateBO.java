package com.luthita.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luthita.lesson03.dao.Real_EstateDAO;
import com.luthita.lesson03.model.Real_Estate;

@Service
public class Real_EstateBO {
	
	@Autowired
	private Real_EstateDAO real_estateDAO;
	
	public Real_Estate getReal_Estate(int rentPrice) {
		return real_estateDAO.selectReal_Estate(rentPrice) ;
	}
}
