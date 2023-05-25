package com.gdu.moovod.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.gdu.moovod.domain.VodCouponDTO;
import com.gdu.moovod.domain.VodDTO;
import com.gdu.moovod.domain.VodPurchaseDTO;
import com.gdu.moovod.domain.VodUserCouponListDTO;
import com.gdu.moovod.domain.VodZzimDTO;

@Mapper
public interface VodMapper {
  
  public int vodCount();
  public List<VodDTO> vodList();
  public List<VodDTO> getVodListUsingScroll(Map<String, Object> map);
  public VodDTO vodGetByNo(int vodNO);  // 특정 영화 상세보기
  public int vodOrderDone(VodPurchaseDTO vodPurchaseDTO); // 주문 완료시 주문 완료 페이지로 이동
  public List<VodCouponDTO> userCouponList(String id);  // 로그인 한 사용자가 가지고 있는 쿠폰만 보여줌
  public double couponUse(String couponName); // 사용자가 쿠폰 선택시 해당 쿠폰에 맞는 할인가 계산
  public void vodCouponUsed(VodUserCouponListDTO vodUserCouponListDTO); // 쿠폰 사용시 사용여부 변경
  public List<VodPurchaseDTO> vodPurchaseList(String id); // id에 맞는 구매내역 가져오기 세션아이디!(이때 영화번호는 영화 DTO를 해야하나?)
  public int zzimAdd(VodZzimDTO vodZzimDTO); // 찜 한 아이디 영화 테이블 저장
  public List<VodZzimDTO> myZzim(String id);   // 나의 찜 목록
}
