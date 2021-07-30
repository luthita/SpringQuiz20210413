package com.luthita.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luthita.lesson06.bo.FavoriteBO;
import com.luthita.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/favorite_view")
	public String quiz01() {

		return "lesson06/quiz01";
	}
	
	@PostMapping("/add_favorite")
	@ResponseBody
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("address") String address
			) {
		favoriteBO.addFavorite(name, address);
		
		return "success";
	}
	@RequestMapping("/favorite_list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favoriteList";
		
		
	}
}
