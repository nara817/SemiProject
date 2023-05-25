package com.gdu.moovod.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.moovod.service.QnaService;

@RequestMapping("/qna")
@Controller
public class QnaController {

  @Autowired
  private QnaService qnaService;
  
  /*
  // 수정해야하는데 모르겠음.
  @GetMapping("/list.do")
  public String list(HttpServletRequest request, Model model) {
    qnaService.loadQnaList(request, model);
    return "qna/list";
  }
  */
  
  @GetMapping("/list.do")
  public String list(Model model) {
    model.addAttribute("qnaList", qnaService.getQnaList());
    return "notice/list";
  
}
  
  
  
  // 여기서부터
  // 10장 게시판에 + 8장 CRUD 심고 있음
  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request, Model model) {
    model.addAttribute("q", qnaService.getQnaByNo(request)); // detail.jsp에서 b로 별명준거 확인해보기
    return "qna/detail";
  }
  

  @PostMapping("/modify.do")
  public void modify(HttpServletRequest request, HttpServletResponse response) {
    qnaService.modifyQna(request, response);
  }
  
  @GetMapping("/write.do")
  public String write() {
    return "qna/write";
  }
  
  /*
  // 수정해야함
  @PostMapping("/add.do")
  public String add(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addResult = qnaService.addQna(request);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/qna/list.do";
  }
  */
  @PostMapping("/add.do")
  public void add(HttpServletRequest request, HttpServletResponse response) {
    qnaService.addQna(request, response);
  }
  
  
  @PostMapping("/removeList.do")
  public void removeList(HttpServletRequest request, HttpServletResponse response) {
    qnaService.removeQnaList(request, response);
  }
  // _여기까지.
  
  
  /*
  // 이것도 달라서 수정해야함.
  @PostMapping("/remove.do")
  public String remove(int qnaNo, RedirectAttributes redirectAttributes) {  // @RequestParam 생략
    int removeResult = qnaService.removeQna(qnaNo);
    redirectAttributes.addFlashAttribute("removeResult", removeResult);
    return "redirect:/qna/list.do";
  }
  */
  
  @PostMapping("/remove.do")
  public void remove(HttpServletRequest request, HttpServletResponse response) {
    qnaService.removeQna(request, response);
  }
  
   
  
  @PostMapping("/reply/add.do")
  public String replyAdd(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addReplyResult = qnaService.addReply(request);
    redirectAttributes.addFlashAttribute("addReplyResult", addReplyResult);
    return "redirect:/qna/list.do";
  }
  
}







