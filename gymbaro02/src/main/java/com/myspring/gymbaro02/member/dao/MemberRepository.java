package com.myspring.gymbaro02.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.member.vo.MemberVO;

@Repository
public class MemberRepository {
	// mapper를 호출하기 위한 클래스 주입.
		@Autowired
		private SqlSession sqlSession;
		
		// 정보 저장
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			sqlSession.insert("mapper.member.kakaoInsert",userInfo);
		}

		// 정보 확인
		public MemberVO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return sqlSession.selectOne("mapper.member.findKakao", userInfo);
		}
}
