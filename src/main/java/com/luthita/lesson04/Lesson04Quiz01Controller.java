package com.luthita.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luthita.lesson04.bo.SellerBO;
import com.luthita.lesson04.model.Seller;

@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	@RequestMapping(path = "/lesson04/quiz01/1", method = RequestMethod.GET)
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@RequestMapping("/lesson04/quiz01/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature
	) {
		
		// db insert
		sellerBO.insertSeller(nickname, profileImageUrl, temperature);
		
		// 결과 jsp
		return "lesson04/afterAddSeller";
	}
	
//	@RequestMapping("/lesson04/quiz01/seller_info")
//	public String sellerInfoView(Model model) {
//		Seller seller = sellerBO.getLastSeller();
//		model.addAttribute("result",seller);
//		model.addAttribute("subject","판매자 정보");
//		return "lesson04/getLastSeller";
//	}
	
	@RequestMapping("/lesson04/quiz01/seller_info")
	public String sellerInfoView(
			@RequestParam(value="id", required=false) Integer id,
			Model model
		) {
		// id parameter가 없는 경우, 가장 최근 등록된 판매자 정보가 나옴
		// id parameter가 있는 경우, 그 id값의 판매자 정보가 나옴
		Seller seller;
		if(id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getLastSellerById(id);
		}
		model.addAttribute("result",seller);
		model.addAttribute("subject","판매자 정보");
		return "lesson04/getLastSeller";
	}
}
