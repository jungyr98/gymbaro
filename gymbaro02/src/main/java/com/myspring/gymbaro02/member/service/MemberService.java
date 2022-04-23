package com.myspring.gymbaro02.member.service;

import java.util.Map;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
}
