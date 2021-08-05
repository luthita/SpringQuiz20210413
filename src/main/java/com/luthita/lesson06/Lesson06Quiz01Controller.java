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

@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/lesson06/quiz01/favorite_view")
	public String quiz01() {

		return "lesson06/quiz01";
	}
	
	@PostMapping("/lesson06/quiz01/add_favorite")
	@ResponseBody
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("address") String address
			) {
		favoriteBO.addFavorite(name, address);
		
		return "success";
	}
	@RequestMapping("/lesson06/quiz01/favorite_list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favoriteList";
		
		
	}
	
	@RequestMapping("/lesson06/quiz02/delete_favorite")
	@ResponseBody
	public String deleteFavorite(
			@RequestParam("favorite_id") int id) {
		
		// DB id로 delete
		int deletedRow = favoriteBO.deleteFavoriteById(id);
		
		// return 결과 행이 1이면 성공, 아니면 실패
		return deletedRow == 1 ? "success" : "fail";
	}
}
