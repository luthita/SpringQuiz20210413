package com.luthita.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luthita.lesson02.bo.StoreBO;
import com.luthita.lesson02.model.Store;
import com.luthita.lesson05.bo.New_ReviewBO;
import com.luthita.lesson05.model.New_Review;

@RequestMapping("/lesson05")
@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	
	
	@RequestMapping("/store")
	public String store(Model model) {
	
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList",storeList);
		
		return "/lesson05/quiz06/store_view";
	}
	
	@Autowired
	private New_ReviewBO new_ReviewBO;
	
	@RequestMapping("/reviews")
	public String reviews(
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName,
			Model model
			) {
		
		List<New_Review> newReviewList = new_ReviewBO.getNew_ReviewListByStoreId(storeId);
		model.addAttribute("newReviewList", newReviewList);
		model.addAttribute("storeName",storeName);
		
		return "/lesson05/quiz06/store_review";
	}
}
