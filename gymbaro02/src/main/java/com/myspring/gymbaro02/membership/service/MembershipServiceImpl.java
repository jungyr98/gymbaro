package com.myspring.gymbaro02.membership.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.gymbaro02.membership.dao.MembershipDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("membershipService")
public class MembershipServiceImpl implements MembershipService {
	@Autowired
	private MembershipDAO membershipDAO;
	
	public String addNewMembership(Map<String,Object> membershipMap) throws Exception {
		String membership_id = membershipDAO.insertNewMembership(membershipMap);
		
		//정상적으로 db에 회원권 추가 후 사용자에게 구매 정보 메세지 보내주기
		membershipResultMessage(membershipMap, membership_id);
		return membership_id;
	}
	
	public void membershipResultMessage(Map<String, Object> membershipMap, String membership_id) {

        String api_key = "NCSFYSP5ZGLEHJYA"; // api key
        String api_secret = "SIDVIQGE0KCAAN0LYTXA6OQJXAM0FMH9"; // api secret
        Message coolsms = new Message(api_key, api_secret);
        
        String phoneNumber = (String) membershipMap.get("phone_number");
        phoneNumber = phoneNumber.replaceAll("-","");
        
        String name = (String) membershipMap.get("name");
        String start_date = (String) membershipMap.get("start_date");
        
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "01030279772");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[짐바로 회원권 구매 정보] 이름 : " + name + ", 회원번호 : " + membership_id + ", 운동시작일 : " + start_date);
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
