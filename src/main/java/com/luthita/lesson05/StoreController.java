package com.luthita.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luthita.lesson02.bo.StoreBO;
import com.luthita.lesson02.model.Store;

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
}
