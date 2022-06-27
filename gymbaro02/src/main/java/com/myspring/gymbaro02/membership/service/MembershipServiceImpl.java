package com.myspring.gymbaro02.membership.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.gymbaro02.config.ApiKey;
import com.myspring.gymbaro02.membership.dao.MembershipDAO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("membershipService")
public class MembershipServiceImpl implements MembershipService {
	@Autowired
	private MembershipDAO membershipDAO;
	@Inject
	private ApiKey apiKey;

	private final String KEY = apiKey.getCoolKey();
	private final String S_KEY = apiKey.getCoolSecret();
	
	
	// 예약하려는 시설에 이전 예약내역이 있는지 확인하기
	@Override
	public MembershipVO selectMembershipHistory(Map<String, Object> infoMap) throws Exception {
		MembershipVO minDate = membershipDAO.selectMembershipHistory(infoMap);
		return minDate;
	}
	
	// 회원권 추가하기
	@Override
	public String addNewMembership(Map<String,Object> membershipMap) throws Exception {
		String membership_id = membershipDAO.insertNewMembership(membershipMap);
		
		//정상적으로 db에 회원권 추가 후 사용자에게 구매 정보 메세지 보내주기
		membershipResultMessage(membershipMap, membership_id);
		return membership_id;
	}
	
	public void membershipResultMessage(Map<String, Object> membershipMap, String membership_id) {

        String api_key = KEY; // api key
        String api_secret = S_KEY; // api secret
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
