package com.gdu.moovod.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class FaqDTO {
	
	private int faqNo;
	private String category;
	private String title;
	private String content;
	
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd-HH:mm", timezone="Asia/Seoul")
	private Timestamp createdAt;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd-HH:mm", timezone="Asia/Seoul")
	private Timestamp modifiedAt;
	private int hit;
	private String id;
	private String writer;
//	private UserDTO userDTO;

	
	// 아이디 메일 조인
	// 어태치 조인
	
}
