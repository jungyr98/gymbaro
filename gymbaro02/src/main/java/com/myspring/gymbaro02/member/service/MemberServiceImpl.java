package com.myspring.gymbaro02.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myspring.gymbaro02.member.dao.MemberDAO;
import com.myspring.gymbaro02.member.dao.MemberRepository;
import com.myspring.gymbaro02.member.dto.KakaoDTO;
import com.myspring.gymbaro02.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberRepository mr;
		
	
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
	
	@Override
	public String idFindSuccess(Map idByEmailMap) throws Exception {
		return memberDAO.idFindSuccess(idByEmailMap);
	}
	
	@Override
	public String idFindSuccessByNum(Map idByNumMap) throws Exception {
		return memberDAO.idFindSuccessByNum(idByNumMap);
	}
	
	@Override
	public String newPwdForm(Map findPwdMap) throws Exception {
		// String result="";
		 return memberDAO.newPwdForm(findPwdMap);
	}
	
	@Override
	public String pwdFindSuccess(Map pwdMap) throws Exception {
		String member_id = (String)pwdMap.get("member_id"); // 이름 찾기용 아이디
		String newPwd = (String)pwdMap.get("newPwd");
		String salt = memberDAO.getSaltById(member_id);
		String password = newPwd;
		password  = SHA256Util.getEncrypt(password, salt);
		pwdMap.put("newPwd", password);
		String member_name= memberDAO.findMemberName(member_id);
	
		int update = memberDAO.pwdFindSuccess(pwdMap); 
	 
		return member_name; 
	}
	
	@Override
	public KakaoDTO getUserInfo(String access_Token) {
	// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
	HashMap<String, Object> userInfo = new HashMap<String, Object>();
	String reqURL = "https://kapi.kakao.com/v2/user/me";
	try {URL url = new URL(reqURL);
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
	// ��û�� �ʿ��� Header�� ���Ե� ����
	conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	int responseCode = conn.getResponseCode();
	System.out.println("responseCode : " + responseCode);
	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	String line = "";
	String result = "";
	while ((line = br.readLine()) != null) {
		result += line;
	}
	System.out.println("response body : " + result);
	JsonParser parser = new JsonParser();
	JsonElement element = parser.parse(result);
	JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	String email = kakao_account.getAsJsonObject().get("email").getAsString();
	userInfo.put("nickname", nickname);
	userInfo.put("email", email);
	} catch (IOException e) {
	e.printStackTrace();
	}
	
	KakaoDTO result = mr.findkakao(userInfo);
	// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
	System.out.println("S:" + result);
	if(result==null) {
	// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
		mr.kakaoinsert(userInfo);
		// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
		return mr.findkakao(userInfo);
		// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
		//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
	} else {
	return result;
	}
	}

	
	//access_token 요청
	@Override
	public String getAccessToken (String authorize_code) {
	String access_Token = "";
	String refresh_Token = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";
	try {
	URL url = new URL(reqURL);
	 
	HttpURLConnection conn = (HttpURLConnection) 
	url.openConnection();
	// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	 
	conn.setRequestMethod("POST");
	conn.setDoOutput(true);
	// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	 
	BufferedWriter bw = new BufferedWriter(new 
	OutputStreamWriter(conn.getOutputStream()));
	StringBuilder sb = new StringBuilder();
	sb.append("grant_type=authorization_code");
	 
	sb.append("&client_id=b45cad6c7b351ab3b0f2ff42b3d5e362"); //본인이 발급받은 key
	sb.append("&redirect_uri=http://localhost:8080/gymbaro02/member/kakaoLogin"); // 본인이 설정한 주소
	 
	sb.append("&code=" + authorize_code);bw.write(sb.toString());
	bw.flush();
	 
	// 결과 코드가 200이라면 성공
	int responseCode = conn.getResponseCode();
	System.out.println("responseCode : " + responseCode);
	 
	// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	BufferedReader br = new BufferedReader(new 
	InputStreamReader(conn.getInputStream()));
	String line = "";
	String result = "";
	 
	while ((line = br.readLine()) != null) {
	result += line;
	}
	System.out.println("response body : " + result);
	 
	// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	JsonParser parser = new JsonParser();
	JsonElement element = parser.parse(result);
	 
	access_Token = 
	element.getAsJsonObject().get("access_token").getAsString();
	refresh_Token = 
	element.getAsJsonObject().get("refresh_token").getAsString();
	 
	System.out.println("access_token : " + access_Token);
	System.out.println("refresh_token : " + refresh_Token);
	 
	br.close();
	bw.close();
	} catch (IOException e) {
	e.printStackTrace();
	}
	return access_Token;
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
