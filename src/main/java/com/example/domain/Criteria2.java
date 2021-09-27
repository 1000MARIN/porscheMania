package com.example.domain;

import lombok.Data;

@Data
public class Criteria2 {
	
	private int pageNum;  // 페이지번호
	private int amount;   // 한 페이지당 글개수
	
	private String type = "";     // 검색유형
	private String keyword = "";  // 검색어
	
	public Criteria2() {
		this(1, 15);
	}

	public Criteria2(Integer pageNum, Integer amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
} // end of Criteria
							