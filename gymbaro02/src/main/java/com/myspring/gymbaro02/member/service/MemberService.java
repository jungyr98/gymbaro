package com.myspring.gymbaro02.member.service;

import java.util.HashMap;
import java.util.Map;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public void certifiedPhoneNumber(String phoneNumber, String cerNum);
	public String getAccessToken (String authorize_code);
	public HashMap<String, Object> getUserInfo(String access_Token);
	public String idFindSuccess(Map idByEmailMap) throws Exception;
	public String idFindSuccessByNum(Map idByNumMap) throws Exception;
	public String pwdFindSuccess(Map pwdMap) throws Exception;
	public String newPwdForm(Map findPwdMap) throws Exception;
}
