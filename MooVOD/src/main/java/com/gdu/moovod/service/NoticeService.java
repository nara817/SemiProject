package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.moovod.domain.NoticeDTO;

public interface NoticeService {
  
  public List<NoticeDTO> getNoticeList();
  public NoticeDTO getNoticeByNo(HttpServletRequest request);
  
  public void addNotice(HttpServletRequest request, HttpServletResponse response);
  public void modifyNotice(HttpServletRequest request, HttpServletResponse response);
  public void removeNotice(HttpServletRequest request, HttpServletResponse response);
  public void removeNoticeList(HttpServletRequest request, HttpServletResponse response);
  public void getNoticeCount();

}
