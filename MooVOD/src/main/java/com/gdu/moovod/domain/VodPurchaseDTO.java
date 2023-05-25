package com.gdu.moovod.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VodPurchaseDTO {

  private int purchaseNo;
  private String id;
  private Date purchaseDate;
  private int purchaseSale;
  private int purchaseLastPrice;
  private int vodNo;
  private String vodTitle; // VOD_TITLE 는 vod테이블에가져온 값을 저장하기 위해서 필요함
  private String vodYoutube; // VOD_YOUTUBE 똑같아
}
