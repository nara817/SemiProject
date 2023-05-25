package com.gdu.moovod.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.moovod.service.NoticeService;
import com.gdu.moovod.service.QnaService;

@RequestMapping("/notice")
@Controller
public class NoticeController {

  
  @Autowired
  private NoticeService noticeService;
  
  @GetMapping("/list.do")
  public String list(Model model) {
    model.addAttribute("noticeList", noticeService.getNoticeList());
    return "notice/list";
  
}
  
  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request, Model model) {
    model.addAttribute("n", noticeService.getNoticeByNo(request)); // detail.jsp에서 b로 별명준거 확인해보기
    return "notice/detail";
  }
  
  @GetMapping("/write.do")
  public String write() {
    return "notice/write";
  }
  
  @PostMapping("/add.do")
  public void add(HttpServletRequest request, HttpServletResponse response) {
    noticeService.addNotice(request, response);
  }
  
  

  @PostMapping("/modify.do")
  public void modify(HttpServletRequest request, HttpServletResponse response) {
    noticeService.modifyNotice(request, response);
  }
  
  @PostMapping("/remove.do")
  public void remove(HttpServletRequest request, HttpServletResponse response) {
    noticeService.removeNotice(request, response);
  }
  
  @PostMapping("/removeList.do")
  public void removeList(HttpServletRequest request, HttpServletResponse response) {
    noticeService.removeNoticeList(request, response);
  }
  
  
  
  
  
  
  
  
  



}