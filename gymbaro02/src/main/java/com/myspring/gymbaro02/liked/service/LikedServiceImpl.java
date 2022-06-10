package com.myspring.gymbaro02.liked.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.liked.dao.LikedDAO;
import com.myspring.gymbaro02.liked.vo.LikedVO;

@Service("likedService")
@Transactional(propagation = Propagation.REQUIRED)
public class LikedServiceImpl implements LikedService {
	@Autowired
	private LikedDAO likedDAO;
	
	// 찜한 시설 추가하기
	@Override
	public void addNewLiked(LikedVO likedVO) throws Exception {
		likedDAO.insertLikedItem(likedVO);
	}
	
	// 찜한 시설리스트 조회하기
	@Override
	public List<LikedVO> listMyLikedList(int uid) throws Exception {
		List<LikedVO> listMyLiked = likedDAO.selectMyLikedList(uid);
		return listMyLiked;
	}
	
	// 찜한 시설 삭제하기
	@Override
	public void deleteLikedItem(List<LikedVO> deleteList) throws Exception {
		likedDAO.deleteLikedItem(deleteList);
	}
}
