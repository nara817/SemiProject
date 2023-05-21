package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.moovod.domain.ReviewsDTO;
import com.gdu.moovod.mapper.ReviewsMapper;
import com.gdu.moovod.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ReviewsServiceImpl implements ReviewsService {
	
	@Autowired
	private ReviewsMapper reviewsMapper;
	private PageUtil pageUtil;
	
	
//reviewsBoard 서비스

        	@Override
        	public List<ReviewsDTO> getReviewsList() {
        		
        		return reviewsMapper.getReviewsList();
        	}
        	
        	@Override
        	public int addReviews(HttpServletRequest request) {
        		try {
        			String category = request.getParameter("reviewCategory");
        			String title = request.getParameter("reviewTitle");
        			String writer = request.getParameter("reviewWriter");
        			String content = request.getParameter("reviewContent");
        			
        			ReviewsDTO reviews = new ReviewsDTO();
        			reviews.setReviewCategory(category);
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
        		
        	  String category = request.getParameter("reviewCategory");
        		String title = request.getParameter("reviewTitle");
        		String content = request.getParameter("reviewContent");
        		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
        
        		ReviewsDTO reviewsDTO = new ReviewsDTO();
        		reviewsDTO.setReviewCategory(category);
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
        	
        	
        	
	
//pagination 서비스
	

          	@Override
          	public void getReviewsListUsingPagination(HttpServletRequest request, Model model) {
          	  String test = request.getParameter("recordPerPage");
          	// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
              Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
              int page = Integer.parseInt(opt1.orElse("1"));
              
              
              
              // 전체 레코드 개수를 구한다.
              int totalRecord = reviewsMapper.getReviewsCount();
          
              
              // 세션에 있는 recordPerPage를 가져온다. 세션에 없는 경우 recordPerPage=10으로 처리한다.
              HttpSession session = request.getSession();
              Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
              int recordPerPage = (int)(opt2.orElse(10));

              // 파라미터 order가 전달되지 않는 경우 order=ASC로 처리한다.
              Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
              String order = opt3.orElse("DESC");

              // 파라미터 column이 전달되지 않는 경우 column=EMPLOYEE_ID로 처리한다.
              Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
              String column = opt4.orElse("REVIEW_NO");
              
              // PageUtil(Pagination에 필요한 모든 정보) 계산하기
              pageUtil.setPageUtil(page, totalRecord, recordPerPage);
              // DB로 보낼 Map 만들기
              Map<String, Object> map = new HashMap<String, Object>();
              map.put("begin", pageUtil.getBegin());
              map.put("end", pageUtil.getEnd());
              map.put("order", order);
              map.put("column", column);
              
          
              
              // begin ~ end 사이의 목록 가져오기
              List<ReviewsDTO> reviewsList = reviewsMapper.getReviewsListUsingPagination(map);
              
              // pagination.jsp로 전달할(forward)할 정보 저장하기
              model.addAttribute("reviewsList", reviewsList);
              model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/board/reviews/list.do?column=" + column + "&order=" + order));
              model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
              switch(order) {
              case "ASC" : model.addAttribute("order", "DESC"); break;  // 현재 ASC 정렬이므로 다음 정렬은 DESC이라고 Jsp에 알려준다.
              case "DESC": model.addAttribute("order", "ASC"); break;
              }
              model.addAttribute("page", page);
              model.addAttribute("reviewsList", reviewsList);
          	}
          	
          	
          

           
            
          	
          	
          	
          

}
