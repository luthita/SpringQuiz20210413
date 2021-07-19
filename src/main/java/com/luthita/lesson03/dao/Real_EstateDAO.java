package com.luthita.lesson03.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.luthita.lesson03.model.Real_Estate;

@Repository
public interface Real_EstateDAO {
	public Real_Estate selectReal_Estate(@Param("rentPrice") int rentPrice);
}
		

