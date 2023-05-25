package com.gdu.moovod.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class VodCouponDTO {
  private String couponName;
  private double couponSale;
  private Date couponEnd;
}
