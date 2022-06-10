package com.myspring.gymbaro02.liked.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.liked.vo.LikedVO;

@Repository("likedDAO")
public class LikedDAOImpl implements LikedDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 찜한 시설 데이터 추가
	@Override
	public void insertLikedItem(LikedVO likedVO) throws DataAccessException {
		sqlSession.insert("mapper.liked.insertLikedItem", likedVO);
	}
	
	// 내 찜 리스트 조회
	@Override
	public List<LikedVO> selectMyLikedList(int uid) throws DataAccessException {
		List<LikedVO> listMyLiked = sqlSession.selectList("mapper.liked.selectMyLikedList", uid);
		return listMyLiked;
	}
	
	// 찜한 시설 삭제
	@Override
	public void deleteLikedItem(List<LikedVO> deleteList) throws DataAccessException{
		for(int i=0; i<deleteList.size(); i++) {
			LikedVO likedVO = deleteList.get(i);
			sqlSession.delete("mapper.liked.deleteLikedItem", likedVO);
		}
	}

}
