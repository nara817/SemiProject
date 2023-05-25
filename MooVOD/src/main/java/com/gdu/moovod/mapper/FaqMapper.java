package com.gdu.moovod.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.FQueryDTO;
import com.gdu.moovod.domain.FaqDTO;

@Mapper
public interface FaqMapper {
  
  // 검색 맵퍼
  public List<FaqDTO> getAllMovies();
  public List<FaqDTO> getMoviesByQuery(FQueryDTO fqueryDTO);
  
  
  public List<FaqDTO> selectFaqList();
  public FaqDTO selectFaqByNo(int faqNo);
  public int insertFaq(FaqDTO faq);
  public int updateFaq(FaqDTO faq);
  public int deleteFaq(int faqNo);
  public int deleteFaqList(List<String> faqNoList);
  public int selectFaqCount();
  

}
