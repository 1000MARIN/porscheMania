package com.example.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String passwd;
	private String name;
	private String birthday;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String email;
	private String recvEmail;
	private Timestamp regDate;
	
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String strDate = sdf.format(regDate);
		
		
		
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVO [id=")
			.append(id)
			.append(", passwd=")
			.append(passwd)
			.append(", name=")
			.append(name)
			.append(", birthday=")
			.append(birthday)
			.append(", postcode=")
			.append(postcode)
			.append(", address=")
			.append(address)
			.append(", detailAddress=")
			.append(detailAddress)
			.append(", extraAddress=")
			.append(extraAddress)
			.append(", email=")
			.append(email)
			.append(", recvEmail=")
			.append(recvEmail)
			.append(", regDate=")
			.append(strDate)
			.append("]");
		return builder.toString();
	} // end of toString
	
} // end of MemberVO
