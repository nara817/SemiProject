package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.FQueryDTO;
import com.gdu.moovod.domain.FaqDTO;
import com.gdu.moovod.mapper.FaqMapper;
import com.gdu.moovod.util.SecurityUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class FaqServiceImpl implements FaqService {

  private FaqMapper faqMapper;
  private SecurityUtil securityUtil;

  // 검색 서비스
  
  @Override
  public Map<String, Object> getAllMovies() {
    List<FaqDTO> list = faqMapper.getAllMovies();
    
    int status = 0;
    String message = null;

    if(list.isEmpty()) {
      status = 500;
      message = "목록이 없습니다.";
    }
    else {
      status = 200;
      message = "전체 " + list.size() + "개의 목록을 가져왔습니다.";
    }
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);
    map.put("message", message);
    map.put("status", status);
    return map;
  }

  @Override
  public Map<String, Object> getMoviesByQuery(FQueryDTO fqueryDTO) {
    
    fqueryDTO.setSearchText(securityUtil.preventXSS(fqueryDTO.getSearchText()));
    
    List<FaqDTO> list = faqMapper.getMoviesByQuery(fqueryDTO);
    int status = 0;
    String message = null;
    
    if(list.isEmpty()) {
      status = 500;
      message = fqueryDTO.getSearchText() + " 검색 결과가 없습니다.";
    }
    else {
      status = 200;
      message = list.size() + " 개의 검색 결과가 있습니다.";
    }
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);
    map.put("message", message);
    map.put("status", status);
    
    return map;
  }
  
  
  
  
  // CRUD 서비스
  @Override
  public List<FaqDTO> getFaqList() {
    return faqMapper.selectFaqList();
  }
  
 
  @Override
  public FaqDTO getFaqByNo(HttpServletRequest request) {
    // 파라미터 qnaNo가 없으면(null, "") 0을 사용한다.
    String strfaqNo = request.getParameter("faqNo");
    int faqNo = 0;
    if(strfaqNo != null && strfaqNo.isEmpty() == false) {
      faqNo = Integer.parseInt(strfaqNo);
    }
    return faqMapper.selectFaqByNo(faqNo);
  }


  @Override
  public void addFaq(HttpServletRequest request, HttpServletResponse response) {

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String id = request.getParameter("id");
    
    FaqDTO faq = new FaqDTO();
    faq.setTitle(title);
    faq.setContent(content);
    faq.setId(id);
    int addResult = faqMapper.insertFaq(faq);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(addResult == 1) {
        out.println("alert('게시글이 등록되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/faq/list.do'");
      } else {
        out.println("alert('게시글이 등록되지 않았습니다.')");
        out.println("history.back()");
      }
      out.println("</script>");
      out.flush();
      out.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
  }

  @Override
  public void modifyFaq(HttpServletRequest request, HttpServletResponse response) {

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int faqNo = Integer.parseInt(request.getParameter("faqNo"));
    
    FaqDTO faq = new FaqDTO();
    faq.setTitle(title);
    faq.setContent(content);
    faq.setFaqNo(faqNo);
    
    int modifyResult = faqMapper.updateFaq(faq);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(modifyResult == 1) {
        out.println("alert('게시글이 수정되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/faq/detail.do?faqNo=" + faqNo + "'");
      } else {
        out.println("alert('게시글이 수정되지 않았습니다.')");
        out.println("history.back()");
      }
      out.println("</script>");
      out.flush();
      out.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
  }


  @Override
  public void removeFaq(HttpServletRequest request, HttpServletResponse response) {

    int faqNo = Integer.parseInt(request.getParameter("faqNo"));

    int removeResult = faqMapper.deleteFaq(faqNo);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == 1) {
        out.println("alert('게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/faq/list.do'");
      } else {
        out.println("alert('게시글이 삭제되지 않았습니다.')");
        out.println("history.back()");
      }
      out.println("</script>");
      out.flush();
      out.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
  }

  @Override
  public void removeFaqList(HttpServletRequest request, HttpServletResponse response) {
    
    String[] faqNoList = request.getParameterValues("faqNoList");
    
    int removeResult = faqMapper.deleteFaqList(Arrays.asList(faqNoList));  // Arrays.asList(boarNoList) : String[] boarNoList를 ArrayList로 바꾸는 코드
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == faqNoList.length) {
        out.println("alert('선택된 모든 게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/faq/list.do'");
      } else {
        out.println("alert('선택된 게시글이 삭제되지 않았습니다.')");
        out.println("history.back()");
      }
      out.println("</script>");
      out.flush();
      out.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
  }
  @Override
  public void getFaqCount() {
    int faqCount = faqMapper.selectFaqCount();
    String msg = "[" + LocalDateTime.now().toString() + "] 게시글 갯수는 " + faqCount + "개입니다.";
    System.out.println(msg);
  }

}
