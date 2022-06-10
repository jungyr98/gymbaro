package com.myspring.gymbaro02.liked.service;

import java.util.List;

import com.myspring.gymbaro02.liked.vo.LikedVO;

public interface LikedService {
	public void addNewLiked(LikedVO likedVO) throws Exception;
	public List<LikedVO> listMyLikedList(int uid) throws Exception;
	public void deleteLikedItem(List<LikedVO> deleteList) throws Exception;
}
