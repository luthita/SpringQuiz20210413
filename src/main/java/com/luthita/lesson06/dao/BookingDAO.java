package com.luthita.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.luthita.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);
}
