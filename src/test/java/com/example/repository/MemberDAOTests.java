package com.example.repository;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Timestamp;

import org.junit.Before;
import org.junit.Test;

import com.example.domain.MemberVO;

public class MemberDAOTests {
	
	// 픽스처(fixture)
		private MemberDAO dao;
		private MemberVO member1, member2;
		
		@Before
		public void setUp() {
			dao = MemberDAO.getInstance();
			dao.deleteAll();
			
			member1 = new MemberVO();
			member1.setId("xxx");
			member1.setPasswd("1234");
			member1.setName("라이언");
			member1.setBirthday("19810720");
			member1.setPostcode("13494"); 
			member1.setAddress("경기 성남시 분당구 판교역로 235"); 
			member1.setDetailAddress("6층"); 
			member1.setExtraAddress("(삼평동)"); 
			member1.setEmail("aaa@a.com");
			member1.setRecvEmail("Y");
			member1.setRegDate(new Timestamp(System.currentTimeMillis()));
			
			member2 = new MemberVO();
			member2.setId("yyy");
			member2.setPasswd("1234");
			member2.setName("라인");
			member2.setBirthday("19791122");
			member2.setPostcode("13561");
			member2.setAddress("경기 성남시 분당구 불정로 6"); 
			member2.setDetailAddress("1층"); 
			member2.setExtraAddress("(정자동)"); 
			member2.setEmail("bbb@b.com");
			member2.setRecvEmail("N");
			member2.setRegDate(new Timestamp(System.currentTimeMillis()));
		} // setUp

		@Test
		public void testConnection() {
			// MySQL DB접속정보
			String url = "jdbc:mysql://localhost:3306/cacaodb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
			String user = "cacao";
			String passwd = "1234";
			try {
				// 1단계. JDBC 드라이버 로딩
				Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버 이름
				// 2단계. DB연결
				Connection con = DriverManager.getConnection(url, user, passwd);
				
				assertNotNull(con);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end of testConnection
	
} // end of MemberDAOTests
