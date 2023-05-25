package com.gdu.moovod.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	
	private int noticeNo;
	private String Category;
	//private int id;
	//private int email;
	private String writer;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;
	private int hits;
	
	// private int attachCount; // UPLOAD 테이블에는 없는 칼럼이지만, 목록 보기에서 정보를 저장하기 위해 사용.
// 아이디 메일 조인
// 어태치 조인

}

