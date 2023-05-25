package com.gdu.moovod.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gdu.moovod.domain.FQueryDTO;
import com.gdu.moovod.service.FaqService;

@RequestMapping("/faq")
@Controller
public class FaqController {
  
  @Autowired
  private FaqService faqService;
  
  // movie_ search controller
  @ResponseBody  
  @GetMapping(value="/searchAllMovies", produces="application/json")
  public Map<String, Object> searchAllMovies(){
    return faqService.getAllMovies();
  }
  
  // movie_ search controller
  @GetMapping(value="/searchMovie", produces="application/json")
  @ResponseBody
  public Map<String, Object> searchMovie(FQueryDTO fqueryDTO){
    return faqService.getMoviesByQuery(fqueryDTO);
  }
  
  
  
  @GetMapping("/list.do")
  public String list(Model model) {
    model.addAttribute("faqList", faqService.getFaqList()); 
    return "faq/list";
  
}
  /*
  @GetMapping("/list.do")
  public String list() {
    return "faq/list";
  
}
*/
  
  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request, Model model) {
    model.addAttribute("f", faqService.getFaqByNo(request)); // detail.jsp에서 b로 별명준거 확인해보기
    return "faq/detail";
  }
  
  @GetMapping("/write.do")
  public String write() {
    return "faq/write";
  }
  
  @PostMapping("/add.do")
  public void add(HttpServletRequest request, HttpServletResponse response) {
    faqService.addFaq(request, response);
  }
  
  

  @PostMapping("/modify.do")
  public void modify(HttpServletRequest request, HttpServletResponse response) {
    faqService.modifyFaq(request, response);
  }
  
  @PostMapping("/remove.do")
  public void remove(HttpServletRequest request, HttpServletResponse response) {
    faqService.removeFaq(request, response);
  }
  
  @PostMapping("/removeList.do")
  public void removeList(HttpServletRequest request, HttpServletResponse response) {
    faqService.removeFaqList(request, response);
  }
  
 


}