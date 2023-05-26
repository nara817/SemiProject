package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.moovod.domain.VodCouponDTO;
import com.gdu.moovod.domain.VodDTO;
import com.gdu.moovod.domain.VodPurchaseDTO;
import com.gdu.moovod.domain.VodZzimDTO;

public interface VodService {

  public List<VodDTO> vodList();

  /* 무한스크롤
   * public Map<String, Object> getVodListUsingScroll(HttpServletRequest request);
   */
  public VodDTO vodGetByNo(HttpServletRequest request);
  public int vodOrderDone(HttpServletRequest request, Model model);
  public List<VodCouponDTO> userCouponList(String id);  // 아이디 세션으로 넣어야함
  public int couponUse(HttpServletRequest request);
  public void couponUsed(HttpServletRequest request); 
  public List<VodPurchaseDTO> vodPurchaseList(String id); // 아이디 세션으로 구매내역 불러오기
  public int zzimAdd(VodZzimDTO vodZzimDTO);
  public List<VodZzimDTO> myZzim(String id);
  public int zzimCount(int vodNo);
}
