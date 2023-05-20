package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.moovod.domain.ReviewsDTO;

public interface ReviewsService {
	
	public List<ReviewsDTO> getReviewsList();
	public int addReviews(HttpServletRequest request);
	public ReviewsDTO getReviewsByNo(HttpServletRequest request);
	public void modifyReviews(HttpServletRequest request, HttpServletResponse response);
	public void removeReviews(HttpServletRequest request, HttpServletResponse response);
	
}
