package com.luthita.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.luthita.lesson03.model.Real_Estate;

@Repository
public interface Real_EstateDAO {
	public Real_Estate selectReal_Estate(int id);
	
	public List<Real_Estate> selectRealEstateListByRentPrice(int rentPrice);
	
	public List<Real_Estate> selectRealEstateListByAreaAndPrice(
	// 파라미터가 2개 이상인 경우 @Param 명시해줄 것!!!
	// {"area"=60, "price"=50000} -> MAP 형태, mapper의 parameterType 에서 map 으로 명시
			@Param("area") int area,
			@Param("price") int price);
 
	public int insertReal_Estate(Real_Estate real_estate);
	
	public int insertReal_EstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") int rentPrice);
	
	public int updateReal_Estate(
			@Param("id")int id,
			@Param("type")String type,
			@Param("price")int price);
	
	public int deleteReal_Estate(int id);
}
		

