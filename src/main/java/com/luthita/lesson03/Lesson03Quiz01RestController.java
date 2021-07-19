package com.luthita.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.luthita.lesson03.bo.Real_EstateBO;
import com.luthita.lesson03.model.Real_Estate;

@RestController
@RequestMapping("/lesson03")
public class Lesson03Quiz01RestController {

	@Autowired
	private Real_EstateBO real_estateBO;
	
	@RequestMapping("/quiz01/1")
	public Real_Estate quiz01_1(
			@RequestParam("id") int id) {
		// request / response
		
		return real_estateBO.getReal_Estate(id);
	}
	
	@RequestMapping("/quiz01/2")
	public List<Real_Estate> quiz01_2(
			@RequestParam("rent_price") int rentPrice) {
		// request / response
		
		return real_estateBO.getReal_EstateListByRentPrice(rentPrice);
	}
	
	@RequestMapping("/quiz01/3")
	public List<Real_Estate> quiz01_3(
			@RequestParam("area") int area,
			@RequestParam("price") int price){
		
		return real_estateBO.getReal_EstateListByAreaAndPrice(area, price);
		
	}
	// ************************** < insert >****************************
	@RequestMapping("quiz02/1")
	public String quiz02_1 () {
		Real_Estate real_estate = new Real_Estate();
		real_estate.setRealtorId(3);
		real_estate.setAddress("푸르지용 리버 303동 1104호");
		real_estate.setArea(89);
		real_estate.setType("매매");
		real_estate.setPrice(100000);
		
		int row = real_estateBO.insertReal_Estate(real_estate);
		return "입력 성공 : " +  row;
	}
	
	@RequestMapping("quiz02/2")
	public String quiz02_2(
			@RequestParam("realtorId") int realtorId) {
		int row = real_estateBO.insertReal_EstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + row;
	}
}
