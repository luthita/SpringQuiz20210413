package com.luthita.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luthita.lesson06.dao.BookingDAO;
import com.luthita.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public void insertBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
}
