package com.gdu.moovod.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.moovod.domain.FQueryDTO;
import com.gdu.moovod.domain.FaqDTO;

public interface FaqService {

  // 검색 서비스
  public Map<String, Object> getAllMovies();
  public Map<String, Object> getMoviesByQuery(FQueryDTO fqueryDTO);
  
  
  // CRUD 서비스
  public List<FaqDTO> getFaqList();
  public FaqDTO getFaqByNo(HttpServletRequest request);
  public void addFaq(HttpServletRequest request, HttpServletResponse response);
  public void modifyFaq(HttpServletRequest request, HttpServletResponse response);
  public void removeFaq(HttpServletRequest request, HttpServletResponse response);
  public void removeFaqList(HttpServletRequest request, HttpServletResponse response);
  public void getFaqCount();
  
}
