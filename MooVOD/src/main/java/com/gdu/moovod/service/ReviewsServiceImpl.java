package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.ReviewsDTO;
import com.gdu.moovod.mapper.ReviewsMapper;

@Service
public class ReviewsServiceImpl implements ReviewsService {
	
	@Autowired
	private ReviewsMapper reviewsMapper;

	@Override
	public List<ReviewsDTO> getReviewsList() {
		
		return reviewsMapper.getReviewsList();
	}
	
	@Override
	public int addReviews(HttpServletRequest request) {
		try {
			
			String title = request.getParameter("reviewTitle");
			String writer = request.getParameter("reviewWriter");
			String content = request.getParameter("reviewContent");
			
			ReviewsDTO reviews = new ReviewsDTO();
			reviews.setReviewTitle(title);
			reviews.setReviewWriter(writer);
			reviews.setReviewContent(content);
			return reviewsMapper.insertReviews(reviews);
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	@Override
	public ReviewsDTO getReviewsByNo(HttpServletRequest request) {
		String strReviewNo = request.getParameter("reviewNo");
		int reviewNo = 0;
		
		if(strReviewNo != null && strReviewNo.isEmpty() == false) {
			reviewNo = Integer.parseInt(strReviewNo);
		}
			reviewsMapper.up(reviewNo);
		 return reviewsMapper.selectReviewsByNo(reviewNo);
		
	}
	
	@Override
	public void modifyReviews(HttpServletRequest request, HttpServletResponse response) {
		
		
		String title = request.getParameter("reviewTitle");
		String content = request.getParameter("reviewContent");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

		ReviewsDTO reviewsDTO = new ReviewsDTO();
		reviewsDTO.setReviewTitle(title);
		reviewsDTO.setReviewContent(content);
		reviewsDTO.setReviewNo(reviewNo);
		
		int modifyResult = reviewsMapper.updateReviews(reviewsDTO);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(modifyResult == 1) {
				out.println("alert('게시글이 수정되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/reviews/detail.do?reviewNo=" + reviewNo + "'");
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
	public void removeReviews(HttpServletRequest request, HttpServletResponse response) {

		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

		int removeResult = reviewsMapper.deleteReviews(reviewNo);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == 1) {
				out.println("alert('게시글이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/board/reviews/list.do'");
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
	

}
