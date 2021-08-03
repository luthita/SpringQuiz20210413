package com.luthita.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.luthita.lesson05.model.New_Review;

@Repository
public interface New_ReviewDAO {
	public List<New_Review> selectNew_ReviewListByStoreId(int storeId);
}
