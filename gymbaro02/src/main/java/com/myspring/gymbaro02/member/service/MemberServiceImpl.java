package com.myspring.gymbaro02.member.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.member.dao.MemberDAO;
import com.myspring.gymbaro02.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public MemberVO login(Map loginMap) throws Exception{
		
		// 입력한 아이디에 해당하는 솔트값 찾은 후 다시 암호화
		String id = (String)loginMap.get("id");
		String pwd = (String)loginMap.get("pwd");
		
		String salt = memberDAO.getSaltById(id);
		String password = pwd;
		password  = SHA256Util.getEncrypt(password, salt);
		
		loginMap.put("pwd", password);
		
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		
		// 비밀번호 암호화 후 다시 set
		String salt = SHA256Util.generateSalt();
		memberVO.setSALT(salt);
		String password = memberVO.getMember_pwd();
		password = SHA256Util.getEncrypt(password, salt);

		memberVO.setMember_pwd(password);	
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	/* 휴대폰 인증 서비스 부분 */
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

	        String api_key = "NCSFYSP5ZGLEHJYA"; // api key
	        String api_secret = "SIDVIQGE0KCAAN0LYTXA6OQJXAM0FMH9"; // api secret
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // 수신전화번호
	        params.put("from", "01030279772");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "[짐바로] 인증번호 " + cerNum + " 를 입력하세요.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }

	    }
}
