package com.myspring.gymbaro02.mypage.service;

import java.util.Map;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MypageService {
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
}
