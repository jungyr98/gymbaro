package com.myspring.gymbaro02.liked.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.liked.vo.LikedVO;

public interface LikedDAO {
	public void insertLikedItem(LikedVO likedVO) throws DataAccessException;
	public List<LikedVO> selectMyLikedList(int uid) throws DataAccessException;
	public void deleteLikedItem(List<LikedVO> deleteList) throws DataAccessException;
}
