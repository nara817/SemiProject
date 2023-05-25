package com.gdu.moovod.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.NoticeDTO;
import com.gdu.moovod.domain.QnaDTO;

@Mapper
public interface QnaMapper {
  
  // 8장 일반 게시판
  public List<QnaDTO> selectQnaList();
  public QnaDTO selectQnaByNo(int qnaNo);
  public int insertQna(QnaDTO qna);
  public int updateQna(QnaDTO qna);
  public int deleteQna(int qnaNo);
  public int deleteQnaList(List<String> qnaList);
  public int selectQnaCount();
  
  
  
  // 9장 계층 게시판
  public int getQnaCount();
  public List<QnaDTO> getQnaList(Map<String, Object> map);
  public int addQna(QnaDTO qna);
  public int removeQna(int qnaNo);
  public int increaseGroupOrder(QnaDTO qna);
  public int addReply(QnaDTO replyDTO); // 타입은 못바꾸니까. 이름이라도 바꿔놈
  
 
  // 조회수
  public int up(int qnaNo); // 조회수
}
