package com.gdu.moovod.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.moovod.domain.VodDTO;
import com.gdu.moovod.domain.VodZzimDTO;
import com.gdu.moovod.service.VodService;

@RequestMapping("/vod")
@Controller
public class VodController {
  
  @Autowired
  private VodService vodService;
  
  
  /* 무한스크롤
   * @GetMapping("/vodList.form") public String scrollPage() { return
   * "vod/vodList"; }
   * 
   * @ResponseBody
   * 
   * @GetMapping(value="/vodList.do", produces="application/json") public
   * Map<String, Object> scroll(HttpServletRequest request) { return
   * vodService.getVodListUsingScroll(request); }
   */
  
@GetMapping("vodList.form")
  public String vodList(Model model){
    List<VodDTO> vodList = vodService.vodList();
    model.addAttribute("vodList", vodList);
    return "vod/vodList";
  }

  @GetMapping("vodDetail.form")
  public String vodDetail(HttpServletRequest request, Model model) {
    model.addAttribute("vodDetail", vodService.vodGetByNo(request));
    model.addAttribute("zzimCount", vodService.zzimCount(Integer.parseInt(request.getParameter("vodNo")))); // 찜 카운트 넘겨주기 
    return "vod/vodDetail";
  }
  
  // 여기선 세션 아이디를 가져와서 쿠폰 비교를 해줘야 함
  @GetMapping("vodOrder.form")
  public String vodOrder(HttpServletRequest request, Model model) {
    model.addAttribute("vodDetail", vodService.vodGetByNo(request));
    String id = request.getParameter("id");
    model.addAttribute("coupon", vodService.userCouponList(id));
    return "vod/vodOrder";
  }
  
  // 주문 완료 시 구매내역에 저장 해야함 뭐를? 여러가지 정보를... 찾아보자 나중은 이 부분은 포스트로 가야할 것 같음 아이디도 가져 와야함.
  @PostMapping("vodOrderDone.form")
  public String vodOrderDone(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
    vodService.vodOrderDone(request, model);
    model.addAttribute("vod", model.getAttribute("vod"));
    model.addAttribute("vodYoutube", model.getAttribute("vodYoutube"));
    /* 어떻게??..... 새로고침 하면 다시 저장 안되게.. 리다이렉트 하면 400계속나옴
     * redirectAttributes.addFlashAttribute("vod", model.getAttribute("vod"));
     * redirectAttributes.addFlashAttribute("vodYoutube",
     * model.getAttribute("vodYoutube"));
     */
    return "/vod/vodOrderDonePage";
  }
  
  // 쿠폰 선택 시
  @GetMapping(value="useCoupon.do", produces = "text/plain")
  @ResponseBody
  public String vodUserCoupon(HttpServletRequest request) {
    
    int salePrice = vodService.couponUse(request);
    return salePrice + "";
  }
  @GetMapping("vodCouponUsed.do")
  public void vodCouponUsed(HttpServletRequest request) {
    vodService.couponUsed(request);
  }
  
  // 마이페이지
  @GetMapping("myVod.form") // 아이디 세션 값 가져와서 -> 구매내역에 보내줘서 셀렉 하기
  public String myVod(HttpServletRequest request, Model model) {
    String id = request.getParameter("id");
    model.addAttribute("myList", vodService.vodPurchaseList(id));
    List<VodZzimDTO> zzimList = vodService.myZzim(id);
    model.addAttribute("myZzim", zzimList);
    return "vod/MyVod";
  }
  
  @GetMapping("ZzimPop.form")
  public String zzim(HttpServletRequest request, HttpSession session, Model model) {
    model.addAttribute("vodNo",Integer.parseInt(request.getParameter("vodNo")));
    model.addAttribute("id", request.getParameter("id"));
    return "vod/ZzimPop";
  }
  
  @PostMapping("ZzimYes.do")
  public String ZzimYes(HttpServletRequest request) {
    String id = request.getParameter("id");
    int vodNo = Integer.parseInt(request.getParameter("vodNo"));
    List<VodZzimDTO> zzimList = vodService.myZzim(id);
    for(VodZzimDTO zzim : zzimList) {
      if(zzim.getVodNo() == vodNo) {
        return "vod/already";
      }
    }
    VodZzimDTO vodZzimDTO = new VodZzimDTO();
    vodZzimDTO.setId(id);
    vodZzimDTO.setVodNo(vodNo);
    vodService.zzimAdd(vodZzimDTO);
    return("/vod/close");
  }
  
  
}
