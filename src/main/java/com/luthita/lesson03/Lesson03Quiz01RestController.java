package com.luthita.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.luthita.lesson03.bo.Real_EstateBO;
import com.luthita.lesson03.model.Real_Estate;

@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private Real_EstateBO real_estateBO;
	
	// 요청 URL : http:// localhost/lesson03/quiz01/1?id=20
//	@RequestMapping("/lesson03/quiz01/1?id=20")
//	public Real_Estate quiz01(
//	
//			@RequestParam(value="id", required=true) int id // 필수 파라미터
//			//@RequestParam(value="id", defaultValue="1") int id // 비필수 파라미터, 디폴트값 1
//	) {
//		return real_estateBO.getReal_Estate(id);
//	}
	
	// 요청 URL : http:// localhost/lesson03/quiz01/1?id=90
		@RequestMapping("/lesson03/quiz01/2?rentPrice=90")
		public Real_Estate quiz01(
		
				@RequestParam(value="rentPrice", required=true) int rentPrice // 필수 파라미터
				//@RequestParam(value="id", defaultValue="1") int id // 비필수 파라미터, 디폴트값 1
		) {
			return real_estateBO.getReal_Estate(rentPrice);
		}
}
