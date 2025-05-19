# 짐바로 Admin & 이커머스 Project 🛍️
<!-- 프로젝트 결과물 -->
<img width="375px" src="https://github.com/user-attachments/assets/44d28c9b-aa29-46dd-abff-d83b7ce9b68c" />
<img width="455px" src="https://github.com/user-attachments/assets/a40d674c-8c32-4bf6-b7f0-b1223b357132" />



## ❔ 소개
- 합리적인 가격으로 원하는 시설 예약, 예약하는 시설과 관련된 용품 구매, 회원들간의 정보 공유 커뮤니티를 이용할 수 있는 쇼핑몰 및
  회원 관리, 용품 관리, 매출 관리 등 관리자 전용 기능이 존재하는 이커머스 프로젝트
- 개발 기간
  * 2022.03.24 ~ 2022.06.24
- 특징
  * Spring Framwork / JSP / MyBatis / Jquery / MySQL 을 이용한 웹 애플리케이션
  * 지오코드 & Distance Matrix API를 사용한 시설 검색 최적화
  * 포트원(구 아임포트) 결제 연동을 통한 이니시스, 카카오페이 결제
  * 쿨에스엠에스 API를 활용한 휴대폰 인증
  * MySQL 트리거 및 프로시저를 아용한 주문 내역 및 적립금 관리, 비회원 장바구니 기능
 
## 📑 Spec

### Language
<img src="https://img.shields.io/badge/Java-407291?style=flat-square&logo=java&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white"/>

### Build Tool
<img src="https://img.shields.io/badge/Apache Maven-C71A36?style=flat-square&logo=apachemaven&logoColor=white"/>

### Skill
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white"/>

### DBMS
<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white"/>

### Version Controll System
<img src="https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white"/>

### IDE
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=eclipseide&logoColor=white"/>

## 📊 기여 내용
![image](https://github.com/user-attachments/assets/7824f17f-b607-4aec-b136-2a276448ce81)
![image](https://github.com/user-attachments/assets/a6a22b05-a07b-4aa4-8422-9e172f2c67f3)


## 🔍 주요 화면
사용자 메인화면 (시설 & 용품) <br />
<img width="380px" src="https://github.com/user-attachments/assets/41f30a31-bcd8-412b-9798-657b754d48a0" />
<img width="450px" src="https://github.com/user-attachments/assets/6432ad76-4cbc-418c-aae6-1cda871baa22" />

로그인 & 마이페이지 <br/>
<img width="375px" src="https://github.com/user-attachments/assets/29986554-ac7f-48cc-b936-bc2d7c3de07a" />
<img width="455px" src="https://github.com/user-attachments/assets/aaefca9c-0ad7-413f-a489-8b792bb9e3f2" />

용품 상세 & 장바구니 <br/>
<img width="445px" src="https://github.com/user-attachments/assets/3fefe699-3b27-45b2-b53d-6e5d6d293260" />
<img width="385px" src="https://github.com/user-attachments/assets/e2d44c2e-c1e7-40a6-833c-c69f45fdfd7c" />

시설 상세 & 찜한 시설 <br/>
<img width="390px" src="https://github.com/user-attachments/assets/46086391-7d9d-497e-a0b9-5abeb9013282" />
<img width="440px" src="https://github.com/user-attachments/assets/24b71666-e596-4391-885f-f2cef8097a1e" />


관리자 화면 (대시보드 & 주문관리 & 상품관리 & 시설관리) <br/>
<img width="450px" src="https://github.com/user-attachments/assets/4c7f0d99-5504-481e-9286-19f33153a6ba" />
<img width="380px" src="https://github.com/user-attachments/assets/9678e0da-9224-4ddd-a8ff-85c2ac108d58" />
<img width="400px" src="https://github.com/user-attachments/assets/2e229cdd-7bf1-4265-8de7-f08f46a45393" />
<img width="430px" src="https://github.com/user-attachments/assets/5f458075-f855-4890-b31c-6d9402dc3f9a" />



## :wrench: 테이블 설계
![image](https://github.com/user-attachments/assets/fc88681b-c747-4846-9817-2d67b839f522)


### :pushpin: 사용법
#### Backend
- src/main/recsources 디렉터리 구조 참조 및 설정 파일 생성
```bash
── src/main
   ├── resources
   │   └── application-API-KEY.properties [KakaoMap | Kakao Login | GoogleMap | CoolSMS | 포트원(구 아임포트) 등 KEY 정보]
   └── webapp
       └── config
           └── jdbc.properties [DB 정보]
``` 


