package com.gdu.moovod.domain;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveUserDTO {
  private String id;
  private String email;
  private Date joinedAt;
  private Date leavedAt;
}