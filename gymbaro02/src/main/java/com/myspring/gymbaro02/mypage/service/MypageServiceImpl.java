package com.myspring.gymbaro02.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.member.service.SHA256Util;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.mypage.dao.MypageDAO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO myPageDAO;
	
	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 if(memberMap.get("member_pwd")!=null) {
			 String salt = myPageDAO.getSaltById(member_id);
			 String member_pwd = (String)memberMap.get("member_pwd");
			 member_pwd = SHA256Util.getEncrypt(member_pwd, salt);
			 
			 boolean confirmPwd = myPageDAO.confirmOldPwd(member_pwd);
			 if(confirmPwd == true) {
				 String newPwd = (String)memberMap.get("newPwd");
				 member_pwd = SHA256Util.getEncrypt(newPwd, salt);
				 memberMap.put("member_pwd", member_pwd);
				 myPageDAO.updateMyInfo(memberMap);
			 }
		 }else {
			 myPageDAO.updateMyInfo(memberMap); 
		 }
		 return myPageDAO.selectMyDetailInfo(member_id);
	}
	
}
