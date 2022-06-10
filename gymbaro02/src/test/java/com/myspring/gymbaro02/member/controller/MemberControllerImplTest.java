package com.myspring.gymbaro02.member.controller;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.gymbaro02.member.service.MemberService;

public class MemberControllerImplTest {
	@Autowired
	MemberService memberService;
	
	@Test
	public void testIdFindSuccessByNum() {
		Map<String, String> findMap = new HashMap<String, String>();
		findMap.put("member_name", "Á¤À¯¶ó");
		findMap.put("phone_number", "");
		try {
			String id = memberService.idFindSuccessByNum(findMap);
			assertNotNull(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
