package com.gdu.moovod.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class VodZzimDTO {
  private int zzimNo;
  private int vodNo;
  private String id;
  private String vodTitle; // VOD_TITLE 는 vod테이블에가져온 값을 저장하기 위해서 필요함  
}
