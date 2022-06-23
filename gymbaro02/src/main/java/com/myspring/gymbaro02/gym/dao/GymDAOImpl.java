package com.myspring.gymbaro02.gym.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymReviewVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.liked.vo.LikedVO;

@Repository("gymDAO")
public class GymDAOImpl implements GymDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 추천 시설 리스트 조회
	@Override
	public List<GymVO> selectRecommandGymsList() throws DataAccessException {
		List<GymVO> gymList = sqlSession.selectList("mapper.gym.selectRecommandGymList");		
		return gymList;
	}
	
	// 주변 시설 리스트 조회
	@Override
	public List<GymVO> selectLocationGymsList(Map<String, Object> condMap) throws DataAccessException {
		List<GymVO> gymList = sqlSession.selectList("mapper.gym.selectLocationGymList", condMap);		
		return gymList;
	}
	
	// 시설 상세 정보 조회
	@Override
	public GymVO selectGymDetail(String gym_id) throws DataAccessException {
		GymVO gymVO = sqlSession.selectOne("mapper.gym.selectGymDetail", gym_id);
		return gymVO;
	}
	
	// 시설 상세 사진 조회
	@Override
	public List<GymImageFileVO> selectGymDetailImage(String gym_id) throws DataAccessException {
		List<GymImageFileVO> imageList = sqlSession.selectList("mapper.gym.selectGymDetailImage", gym_id);
		return imageList;
	}
	
	// 해당 시설 찜 해당 여부 확인
	@Override
	public int likedState(LikedVO likedVO) throws DataAccessException {
		int likedState = sqlSession.selectOne("mapper.gym.likedState", likedVO);
		return likedState;
	}
	
	@Override
	public void newReview(GymReviewVO gymReviewVO) throws DataAccessException {
		sqlSession.insert("mapper.gym.addNewReview", gymReviewVO);
	}
	
	@Override
	public List<GymReviewVO> viewAll(String gym_id) throws DataAccessException {
		return sqlSession.selectList("mapper.gym.viewAll", gym_id);
	}
	
	@Override
	public double getGymAvg(String gym_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.gym.getGymAvg", gym_id);
	}
	
	@Override
	public double getInstructorAvg(String gym_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.gym.getInstructorAvg", gym_id);
	}
	
	@Override
	public double getAccessAvg(String gym_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.gym.getAccessAvg", gym_id);
	}
	
	@Override
	public double getPersonalScoreAvg_gym(Map personalScoreMap) throws DataAccessException{
		return sqlSession.selectOne("mapper.gym.getPersonalScoreAvg_gym", personalScoreMap);
	}
	
	@Override
	public double getPersonalScoreAvg_instructor(Map personalScoreMap) throws DataAccessException{
		return sqlSession.selectOne("mapper.gym.getPersonalScoreAvg_instructor", personalScoreMap); 
	}
	
	@Override
	public double getPersonalScoreAvg_access(Map personalScoreMap) throws DataAccessException{
		return sqlSession.selectOne("mapper.gym.getPersonalScoreAvg_access", personalScoreMap);
	}
	
	@Override
	public String getReviewCount(String gym_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.gym.getReviewCount", gym_id);
	}
	
	@Override
	public void deleteReview(int review_id) throws DataAccessException {
		sqlSession.delete("mapper.gym.deleteReview", review_id);
	}
	
	@Override
	public int getMembershipInfo(Map membershipInfoMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.gym.getMembershipInfo", membershipInfoMap);
	}
	
	@Override
	public void updateReviewState(Map updateReviewMap) throws DataAccessException {
		sqlSession.update("mapper.gym.updateReviewState", updateReviewMap);
	}
	
	@Override
	public void deleteGymReview(Map deleteReviewMap) throws DataAccessException {
		sqlSession.delete("mapper.gym.deleteGymReview", deleteReviewMap);
	}
}
