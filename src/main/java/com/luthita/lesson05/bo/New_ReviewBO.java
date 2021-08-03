package com.luthita.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luthita.lesson02.bo.StoreBO;
import com.luthita.lesson05.dao.New_ReviewDAO;
import com.luthita.lesson05.model.New_Review;

@Service
public class New_ReviewBO {

	@Autowired
	private New_ReviewDAO new_ReviewDAO;
	private StoreBO storeBO;
	
	public List<New_Review> getNew_ReviewListByStoreId(int storeId){
		return  new_ReviewDAO.selectNew_ReviewListByStoreId(storeId);
	}
}
