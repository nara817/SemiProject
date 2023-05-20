package com.gdu.moovod.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.ReviewsDTO;

@Mapper
public interface ReviewsMapper {
	
	public List<ReviewsDTO> getReviewsList();
	public int insertReviews(ReviewsDTO reviewsDTO);
	public ReviewsDTO selectReviewsByNo(int reviewNo);
	public int up(int reviewNo);
	public int updateReviews(ReviewsDTO reviewsDTO);
	public int deleteReviews(int reviewNo);


}
