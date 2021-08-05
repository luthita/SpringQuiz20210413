package com.luthita.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luthita.lesson06.bo.BookingBO;
import com.luthita.lesson06.model.Booking;

@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/lesson06/pension_home")
	public String home() {
		
		return "lesson06/pensionMain";
	}
	
	@RequestMapping("/lesson06/reservation_list")
	public String list(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/pensionList";
	}
	
	@RequestMapping("/lesson06/delete_reserved")
	@ResponseBody
	public String deleteReserved(
			@RequestParam("reserved_Id") int id) {
		
		int deletedRow = bookingBO.deleteBookingById(id);
		
		return deletedRow == 1 ? "success" : "fail";
	}
}
