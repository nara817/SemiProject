package com.gdu.moovod.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class VodUserCouponListDTO {
  private int userCouponNo;
  private String couponName;
  private String id;
  private int couponUse;
}
