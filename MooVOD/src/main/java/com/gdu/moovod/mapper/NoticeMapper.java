package com.gdu.moovod.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.NoticeDTO;

@Mapper
public interface NoticeMapper {
  
  public List<NoticeDTO> selectNoticeList();
  public NoticeDTO selectNoticeByNo(int noticeNo);
  public int insertNotice(NoticeDTO notice);
  public int updateNotice(NoticeDTO notice);
  public int deleteNotice(int noticeNo);
  public int deleteNoticeList(List<String> noticeNoList);
  public int selectNoticeCount();

}
