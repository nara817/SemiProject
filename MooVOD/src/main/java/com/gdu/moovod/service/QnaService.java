package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.moovod.domain.QnaDTO;

public interface QnaService {
  
  public List<QnaDTO> getQnaList();
  public QnaDTO getQnaByNo(HttpServletRequest request);
  
  public void modifyQna(HttpServletRequest request, HttpServletResponse response);
  public void removeQnaList(HttpServletRequest request, HttpServletResponse response);
  
  
  
  public void loadQnaList(HttpServletRequest request, Model model);
  public void addQna(HttpServletRequest request, HttpServletResponse response);
  public void removeQna(HttpServletRequest request, HttpServletResponse response);
  public int addReply(HttpServletRequest request); // id받아와야지.

  public void getQnaCount();
  

}
