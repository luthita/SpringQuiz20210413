package com.luthita.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.luthita.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {

	public void insertFavorite(
			@Param("name") String name,
			@Param("address") String address);
	
	public List<Favorite> selectFavoriteList();
}
