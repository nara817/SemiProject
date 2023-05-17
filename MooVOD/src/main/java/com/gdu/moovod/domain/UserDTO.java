package com.gdu.moovod.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	   private String memberId;
	   private String memberPw;
	   private String memberName;
	   private String memberPhone;
	   private String memberEmail;
	   private LocalDate memberBirth;
	   private String gender;
	   private String sessionKey;
	   private LocalDateTime sessionLimit;


	}