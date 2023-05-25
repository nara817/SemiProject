package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.moovod.domain.VodCouponDTO;
import com.gdu.moovod.domain.VodDTO;
import com.gdu.moovod.domain.VodPurchaseDTO;
import com.gdu.moovod.domain.VodUserCouponListDTO;
import com.gdu.moovod.domain.VodZzimDTO;
import com.gdu.moovod.mapper.VodMapper;
import com.gdu.moovod.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class VodServiceImpl implements VodService {

  private VodMapper vodMapper;
  private PageUtil pageUtil;

  /* 무한스크롤
   * @Override public Map<String, Object> getVodListUsingScroll(HttpServletRequest
   * request) { // 파라미터 page가 전달되지 않는 경우 page=1로 처리한다. Optional<String> opt1 =
   * Optional.ofNullable(request.getParameter("page")); int page =
   * Integer.parseInt(opt1.orElse("1"));
   * 
   * // 전체 레코드 개수를 구한다. int totalRecord = vodMapper.vodCount();
   * 
   * // recordPerPage = 9로 처리한다. int recordPerPage = 10;
   * 
   * // PageUtil(Pagination에 필요한 모든 정보) 계산하기 pageUtil.setPageUtil(page,
   * totalRecord, recordPerPage);
   * 
   * // DB로 보낼 Map 만들기 Map<String, Object> map = new HashMap<String, Object>();
   * map.put("begin", pageUtil.getBegin()); map.put("end", pageUtil.getEnd());
   * 
   * // begin ~ end 사이의 목록 가져오기 List<VodDTO> vodList =
   * vodMapper.getVodListUsingScroll(map);
   * 
   * // scroll.jsp로 응답할 데이터 Map<String, Object> resultMap = new HashMap<String,
   * Object>(); resultMap.put("vodList", vodList); resultMap.put("totalPage",
   * pageUtil.getTotalPage());
   * 
   * // 응답 return resultMap; }
   */
  
  
  @Override
  public List<VodDTO> vodList() {
    return vodMapper.vodList();
  }
  
  @Override
  public VodDTO vodGetByNo(HttpServletRequest request) {
    int vodNo = Integer.parseInt(request.getParameter("vodNo"));
    return vodMapper.vodGetByNo(vodNo);
  }
  
  @Override
  public int vodOrderDone(HttpServletRequest request, Model model) {
    VodPurchaseDTO vodPurchaseDTO = new VodPurchaseDTO();
    String id = request.getParameter("id");
    int vodNo = Integer.parseInt(request.getParameter("vodNo"));
    int vodPrice = Integer.parseInt(request.getParameter("vodPrice"));
    int purchasLastPrice = Integer.parseInt(request.getParameter("purchasLastPrice"));
    vodPurchaseDTO.setId(id);
    vodPurchaseDTO.setPurchaseSale(vodPrice);
    vodPurchaseDTO.setVodNo(vodNo);
    vodPurchaseDTO.setPurchaseLastPrice(purchasLastPrice);
    model.addAttribute("vod", vodPurchaseDTO);
    VodDTO vodDTO = new VodDTO();
    vodDTO = vodMapper.vodGetByNo(vodNo);
    model.addAttribute("vodYoutube", vodDTO);
    return vodMapper.vodOrderDone(vodPurchaseDTO);
  }

  // 유저 id는 세션값으로 가져와야해서 추후 수정 필요
  @Override
  public List<VodCouponDTO> userCouponList(String id) {
    List<VodCouponDTO> userCouponList = vodMapper.userCouponList(id);
    return userCouponList;
  }
  
  // 쿠폰 사용 안함 선택시 할인 후 가격에 정가가 그대로 가야함, 쿠폰사용안함은 임의의 쿠폰 번호를 올려둬야함
  @Override
  public int couponUse(HttpServletRequest request) {
    double vodPrice = Double.parseDouble(request.getParameter("vodPrice"));
    String couponName = request.getParameter("couponName");
    if(couponName.equals("쿠폰사용안함")) {
      int salePrice = (int)vodPrice;
      return salePrice;
    }
    // 할인 가격 구하기
    int salePrice = (int)(vodPrice - (vodPrice * vodMapper.couponUse(couponName)));
    System.out.println(salePrice);
    return salePrice;
  }
  
  // 쿠폰 사용 완료시.. 실패...
  @Override
  public void couponUsed(HttpServletRequest request) {
    VodUserCouponListDTO vodUserCouponListDTO = new VodUserCouponListDTO();
    
    String id = request.getParameter("id");
    String couponName = request.getParameter("couponName");   // 한글이여서 인코딩 UTF-8로 받아야함
    vodUserCouponListDTO.setId(id);
    vodUserCouponListDTO.setCouponName(couponName);
    vodMapper.vodCouponUsed(vodUserCouponListDTO);
  }
  
  // 구매내역 가져오기
  @Override
  public List<VodPurchaseDTO> vodPurchaseList(String id) {
    List<VodPurchaseDTO> list = vodMapper.vodPurchaseList(id);
    return list;
  }
  
  
  @Override
  public int zzimAdd(VodZzimDTO vodZzimDTO) {
    return vodMapper.zzimAdd(vodZzimDTO);
  }
  
  // 내 찜 모록 가져오기
  @Override
  public List<VodZzimDTO> myZzim(String id) {
    List<VodZzimDTO> zzimList = vodMapper.myZzim(id);
    return zzimList;
  }
  
}
