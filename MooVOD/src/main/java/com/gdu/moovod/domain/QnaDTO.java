package com.gdu.moovod.domain;

import java.security.Timestamp;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaDTO {
	
  private int qnaNo;
  private String category;
  private String writer;
  private String title;
  private String content;
  private Timestamp createdAt;
  private Timestamp modifiedAt;
  
  private int state;
  private int depth;
  private int groupNo;
  private int groupOrder; 
	private int hits;
	
	// 아이디 메일? 조인
	// 어태치 조인
	// 비밀글 조인 private boolean secret;
  
}
