package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.moovod.domain.QnaDTO;
import com.gdu.moovod.mapper.QnaMapper;
import com.gdu.moovod.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class QnaServiceImpl implements QnaService {

  private QnaMapper qnaMapper;
  private PageUtil pageUtil;
  
  @Override
  public List<QnaDTO> getQnaList() {
    return qnaMapper.selectQnaList();
  }
  
  @Override
  public QnaDTO getQnaByNo(HttpServletRequest request) {

    String strqnaNo = request.getParameter("qnaNo");
    int qnaNo = 0;
    if(strqnaNo != null && strqnaNo.isEmpty() == false) {
      qnaNo = Integer.parseInt(strqnaNo);
    }
    return qnaMapper.selectQnaByNo(qnaNo);
  }

  @Override
  public void modifyQna(HttpServletRequest request, HttpServletResponse response) {
   
    int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    QnaDTO qna = new QnaDTO();
    qna.setQnaNo(qnaNo);
    qna.setCategory(category);
    qna.setTitle(title);
    qna.setContent(content);
    
    int modifyResult = qnaMapper.updateQna(qna);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(modifyResult == 1) {
        out.println("alert('게시글이 수정되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/qna/detail.do?qnaNo=" + qnaNo + "'");
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
  public void removeQnaList(HttpServletRequest request, HttpServletResponse response) {
    
    String[] qnaNoList = request.getParameterValues("qnaNoList");
    
    int removeResult = qnaMapper.deleteQnaList(Arrays.asList(qnaNoList));  // Arrays.asList(boarNoList) : String[] boarNoList를 ArrayList로 바꾸는 코드
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == qnaNoList.length) {
        out.println("alert('선택된 모든 게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/qna/list.do'");
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
  public void loadQnaList(HttpServletRequest request, Model model) {

    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    int totalRecord = qnaMapper.getQnaCount();
    
    int recordPerPage = 20;
    
    pageUtil.setPageUtil(page, totalRecord, recordPerPage);
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("begin", pageUtil.getBegin());
    map.put("end", pageUtil.getEnd());
    
    List<QnaDTO> qnaList = qnaMapper.getQnaList(map);
    
    model.addAttribute("qnaList", qnaList);
    model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
    model.addAttribute("pagination", pageUtil.getPagination(request.getRequestURI()));
    
  }
  

  @Override
  public void addQna(HttpServletRequest request, HttpServletResponse response) {
    
    // 파라미터 writer, title
    String category = request.getParameter("category");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    
    // DB로 보낼 BbsDTO 객체
    QnaDTO qnaDTO = new QnaDTO();
    qnaDTO.setCategory(category);
    qnaDTO.setWriter(writer);
    qnaDTO.setTitle(title);
    qnaDTO.setContent(content);
    
    // 원글 달기
    int addResult = qnaMapper.insertQna(qnaDTO);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(addResult == 1) {
        out.println("alert('게시글이 등록되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/qna/list.do'");
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
  public void removeQna(HttpServletRequest request, HttpServletResponse response) {
    
    int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
    
    int removeResult = qnaMapper.removeQna(qnaNo);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == 1) {
        out.println("alert('게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/qna/list.do'");
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
  @Transactional(readOnly = true) //인설트딜리트업데이트 중 2개이상의 쿼리를 실행하는 경우 반드시 추가한다.
  @Override
  public int addReply(HttpServletRequest request) {
    
    // 카테고리 추가?
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    // 원글의 정보(파라미터 depth, groupNo, groupOrder)
    int depth = Integer.parseInt(request.getParameter("depth"));
    int groupNo = Integer.parseInt(request.getParameter("groupNo"));
    int groupOrder = Integer.parseInt(request.getParameter("groupOrder"));
    
    
    // 기존답글의 선행 작업은 원글이 필요하다.
    // 원글 bbsDTO (기존 답글 선행 작업: increaseGroupOrder를 위한 DTO)
    QnaDTO qnaDTO = new QnaDTO();
    qnaDTO.setGroupNo(groupNo);
    qnaDTO.setGroupOrder(groupOrder);
    
    
    // 기존 답글 선행 작업
    qnaMapper.increaseGroupOrder(qnaDTO);
    
    // 답글  ReplyDTO
    QnaDTO replyDTO = new QnaDTO();
    // 카테고리 추가?
    replyDTO.setWriter(writer);
    replyDTO.setTitle(title);
    //replyDTO.setContent(content);
    replyDTO.setDepth(depth + 1);
    replyDTO.setGroupNo(groupNo);
    replyDTO.setGroupOrder(groupOrder + 1);
    
    int addReplyResult = qnaMapper.addReply(replyDTO);
    return addReplyResult;
  }
  
  
  @Override
  public void getQnaCount() {

    int qnaCount = qnaMapper.selectQnaCount();
    String msg = "[" + LocalDateTime.now().toString() + "] 게시글 갯수는 " + qnaCount + "개입니다.";
    System.out.println(msg);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

}
