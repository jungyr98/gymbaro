package com.myspring.gymbaro02.admin.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.member.dao.AdminMemberDAO;
import com.myspring.gymbaro02.member.service.SHA256Util;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	
	// 관리자 로그인
	@Override
	public MemberVO adminLogin(Map<String, Object> loginMap) throws Exception {
		// 입력한 아이디에 해당하는 솔트값 찾은 후 다시 암호화
			String id = (String)loginMap.get("id");
			String pwd = (String)loginMap.get("pwd");
			
			String salt = adminMemberDAO.getSaltById(id);
			if(salt != "" && salt != null) {
				String password = pwd;
				password  = SHA256Util.getEncrypt(password, salt);
			
				loginMap.put("pwd", password);
			}	
			return adminMemberDAO.adminLogin(loginMap);
	}
	
	// 회원 리스트 조회
	@Override
	public List<MemberVO> listMember() throws Exception {
		List<MemberVO> listMember = new ArrayList<MemberVO>();
		listMember = adminMemberDAO.listMember();
		return listMember;
	}
	
	// 회원 등급 수정하기
	@Override
	public void updateMemberLevel(Map<String, Object> updateLevelMap) throws Exception {
		adminMemberDAO.updateMemberLevel(updateLevelMap);
	}
	
	// 회원 포인트 수정하기
	@Override
	public void updateMemberPoint(Map<String, Object> updatePointMap) throws Exception {
		adminMemberDAO.updateMemberPoint(updatePointMap);
	}
	
	// 회원 삭제(탈퇴)
	@Override
	public void deleteMember(List<MemberVO> deleteList) throws Exception {
		adminMemberDAO.deleteMember(deleteList);
	}
	
	// 해당 회원 정보 상세
	@Override
	public MemberVO selectMemberDetail(int uid) throws Exception {
		MemberVO memberVO = adminMemberDAO.selectMemberDetail(uid);
		return memberVO;
	}

}
