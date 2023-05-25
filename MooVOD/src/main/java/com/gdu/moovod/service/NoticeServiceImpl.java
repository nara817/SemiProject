package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.NoticeDTO;
import com.gdu.moovod.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

  
  @Autowired
  private NoticeMapper noticeMapper;
  
  @Override
  public List<NoticeDTO> getNoticeList() {
    return noticeMapper.selectNoticeList();
  }

  @Override
  public NoticeDTO getNoticeByNo(HttpServletRequest request) {

    String strnoticeNo = request.getParameter("noticeNo");
    int noticeNo = 0;
    if(strnoticeNo != null && strnoticeNo.isEmpty() == false) {
      noticeNo = Integer.parseInt(strnoticeNo);
    }
    return noticeMapper.selectNoticeByNo(noticeNo);
  }


  @Override
  public void addNotice(HttpServletRequest request, HttpServletResponse response) {

    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    NoticeDTO notice = new NoticeDTO();
    notice.setWriter(writer);
    notice.setTitle(title);
    notice.setContent(content);
    
    int addResult = noticeMapper.insertNotice(notice);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(addResult == 1) {
        out.println("alert('게시글이 등록되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/notice/list.do'");
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
  public void modifyNotice(HttpServletRequest request, HttpServletResponse response) {

    int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    // qnaDAO로 전달할 qnaDTO를 만든다.
    NoticeDTO notice = new NoticeDTO();
    notice.setNoticeNo(noticeNo);
    notice.setTitle(title);
    notice.setCategory(category);
    notice.setContent(content);
    
    int modifyResult = noticeMapper.updateNotice(notice);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(modifyResult == 1) {
        out.println("alert('게시글이 수정되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/notice/detail.do?noticeNo=" + noticeNo + "'");
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
  public void removeNotice(HttpServletRequest request, HttpServletResponse response) {

    int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

    int removeResult = noticeMapper.deleteNotice(noticeNo);
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == 1) {
        out.println("alert('게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/notice/list.do'");
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
  public void removeNoticeList(HttpServletRequest request, HttpServletResponse response) {
    
    String[] noticeNoList = request.getParameterValues("noticeNoList");
    
    int removeResult = noticeMapper.deleteNoticeList(Arrays.asList(noticeNoList));  // Arrays.asList(boarNoList) : String[] boarNoList를 ArrayList로 바꾸는 코드
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      out.println("<script>");
      if(removeResult == noticeNoList.length) {
        out.println("alert('선택된 모든 게시글이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/notice/list.do'");
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
  public void getNoticeCount() {
    int noticeCount = noticeMapper.selectNoticeCount();
    String msg = "[" + LocalDateTime.now().toString() + "] 게시글 갯수는 " + noticeCount + "개입니다.";
    System.out.println(msg);
  }

}
