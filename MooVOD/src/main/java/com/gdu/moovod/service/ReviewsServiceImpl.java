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
  @Autowired
	private PageUtil pageUtil;
	
	
//reviewsBoard 서비스

        	@Override
        	public void getReviewsList(HttpServletRequest request, Model model) {
        		
        	  // 'page' 매개변수가 제공되지 않으면 1로 설정합니다.
            Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
            int page = Integer.parseInt(opt1.orElse("1"));

            // 세션에서 'recordPerPage' 값을 가져옵니다. 세션에 없을 경우 10으로 기본값을 설정합니다.
            HttpSession session = request.getSession();
            Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
            int recordPerPage = (int)(opt2.orElse(10));

            // 'order' 매개변수가 제공되지 않으면 'DESC'로 설정합니다.
            Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
            String order = opt3.orElse("DESC");

            // 'column' 매개변수가 제공되지 않으면 'REVIEW_NO'로 설정합니다.
            Optional<String> opt4 = Optional.ofNullable(request.getParameter("orderColumn"));
            String orderColumn = opt4.orElse("REVIEW_NO");
            
            
            // 파라미터 column이 전달되지 않는 경우 column=""로 처리한다. (검색할 칼럼)
            Optional<String> opt5 = Optional.ofNullable(request.getParameter("searchColumn"));
            String searchColumn = opt5.orElse("");
            
            // 파라미터 query가 전달되지 않는 경우 query=""로 처리한다. (검색어)
            Optional<String> opt6 = Optional.ofNullable(request.getParameter("query"));
            String query = opt6.orElse("");
            
            
            // column과 query를 이용해 검색된 레코드 개수를 구한다.
            int totalRecord = reviewsMapper.getReviewsCount();
            
 
            // 'recordPerPage' 값이 변경되었을 때, 현재 페이지의 데이터가 없는 경우를 확인합니다.
            int totalPage = (int) Math.ceil((double) totalRecord / recordPerPage);
            if ((page - 1) * recordPerPage >= totalRecord) {
                page = Math.max(totalPage, 1);
            }
            

            // 페이지 유틸리티(PageUtil)를 계산합니다. (페이지네이션에 필요한 모든 정보 포함)
            pageUtil.setPageUtil(page, totalRecord, recordPerPage);
            // 데이터베이스로 전달할 맵(Map)을 생성합니다.
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("begin", pageUtil.getBegin());
            map.put("end", pageUtil.getEnd());
            map.put("order", order);
            map.put("orderColumn", orderColumn);
            map.put("searchColumn", searchColumn);
            map.put("query", query);

            // 지정된 범위(begin ~ end)의 목록을 가져옵니다.
            List<ReviewsDTO> reviewsList = reviewsMapper.getReviewsList(map);
            
            // pagination.jsp로 전달할 정보를 저장합니다.
            model.addAttribute("reviewsList", reviewsList);
            model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/board/reviews/list.do?orderColumn=" + orderColumn + "&order=" + order + "&searchColumn=" + searchColumn + "&query=" + query));
            model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
            switch (order) {
                case "ASC":
                    model.addAttribute("order", "DESC");
                    break;  // 현재 정렬 순서가 ASC인 경우, 다음 정렬은 DESC임을 JSP에 알립니다.
                case "DESC":
                    model.addAttribute("order", "ASC");
                    break;
            }
            model.addAttribute("page", page);
            model.addAttribute("reviewsList", reviewsList);

            // 마지막 페이지로 이동하는 경우 파라미터 값도 같이 변경합니다.
            if (page > totalPage) {
                // 마지막 페이지로 설정합니다.
                page = totalPage;
                // 파라미터 값을 변경합니다.
                map.put("begin", pageUtil.getBegin());
                map.put("end", pageUtil.getEnd());
            }
        	}
        	
        	@Override
        	public int addReviews(HttpServletRequest request) {
        	  try {
              String title = request.getParameter("reviewTitle");
              String category = request.getParameter("reviewCategory");
              String id = request.getParameter("id");
              String content = request.getParameter("reviewContent");
              Double star = Double.parseDouble(request.getParameter("reviewStar"));
              
              ReviewsDTO reviews = new ReviewsDTO();
              reviews.setReviewCategory(category);
              reviews.setReviewTitle(title);
              reviews.setId(id);
              reviews.setReviewContent(content);
              reviews.setReviewStar(star);
              System.out.println(reviews + "입니다");
              return reviewsMapper.insertReviews(reviews);
            } catch (Exception e) {
              e.printStackTrace();
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
        		String category = request.getParameter("reviewCategory");
        		String content = request.getParameter("reviewContent");
        	  double star = Double.parseDouble(request.getParameter("reviewStar"));
        		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
        
        		ReviewsDTO reviewsDTO = new ReviewsDTO();
        		reviewsDTO.setReviewCategory(category);
        		reviewsDTO.setReviewTitle(title);
        		reviewsDTO.setReviewContent(content);
        		reviewsDTO.setReviewStar(star);
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

        /*	
        	@Override
        	public void getReviewsListUsingPagination(HttpServletRequest request, Model model) {
        	    // 'page' 매개변수가 제공되지 않으면 1로 설정합니다.
        	    Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
        	    int page = Integer.parseInt(opt1.orElse("1"));
        	    
        	    

        	   
   

        	    // 세션에서 'recordPerPage' 값을 가져옵니다. 세션에 없을 경우 10으로 기본값을 설정합니다.
        	    HttpSession session = request.getSession();
        	    Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
        	    int recordPerPage = (int)(opt2.orElse(10));

        	    // 'order' 매개변수가 제공되지 않으면 'DESC'로 설정합니다.
        	    Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
        	    String order = opt3.orElse("DESC");

        	    // 'column' 매개변수가 제공되지 않으면 'REVIEW_NO'로 설정합니다.
        	    Optional<String> opt4 = Optional.ofNullable(request.getParameter("orderColumn"));
        	    String orderColumn = opt4.orElse("REVIEW_NO");
        	    
        	    
        	    // 파라미터 column이 전달되지 않는 경우 column=""로 처리한다. (검색할 칼럼)
              Optional<String> opt5 = Optional.ofNullable(request.getParameter("searchColumn"));
              String searchColumn = opt5.orElse("");
              
              // 파라미터 query가 전달되지 않는 경우 query=""로 처리한다. (검색어)
              Optional<String> opt6 = Optional.ofNullable(request.getParameter("query"));
              String query = opt6.orElse("");
              
              
              // column과 query를 이용해 검색된 레코드 개수를 구한다.
              int totalRecord = reviewsMapper.getReviewsCount();
              
              
              
              
              

        	    // 'recordPerPage' 값이 변경되었을 때, 현재 페이지의 데이터가 없는 경우를 확인합니다.
        	    int totalPage = (int) Math.ceil((double) totalRecord / recordPerPage);
        	    if ((page - 1) * recordPerPage >= totalRecord) {
        	        page = Math.max(totalPage, 1);
        	    }
        	    
        	    
        	    
        	    
        	    

        	    // 페이지 유틸리티(PageUtil)를 계산합니다. (페이지네이션에 필요한 모든 정보 포함)
        	    pageUtil.setPageUtil(page, totalRecord, recordPerPage);
        	    // 데이터베이스로 전달할 맵(Map)을 생성합니다.
        	    Map<String, Object> map = new HashMap<String, Object>();
        	    map.put("begin", pageUtil.getBegin());
        	    map.put("end", pageUtil.getEnd());
        	    map.put("order", order);
        	    map.put("orderColumn", orderColumn);
        	    map.put("searchColumn", searchColumn);
              map.put("query", query);

        	    // 지정된 범위(begin ~ end)의 목록을 가져옵니다.
        	    List<ReviewsDTO> reviewsList = reviewsMapper.getReviewsListUsingPagination(map);
        	    
        	    // pagination.jsp로 전달할 정보를 저장합니다.
        	    model.addAttribute("reviewsList", reviewsList);
        	    model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/board/reviews/list.do?orderColumn=" + orderColumn + "&order=" + order + "&searchColumn=" + searchColumn + "&query=" + query));
        	    model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
        	    switch (order) {
        	        case "ASC":
        	            model.addAttribute("order", "DESC");
        	            break;  // 현재 정렬 순서가 ASC인 경우, 다음 정렬은 DESC임을 JSP에 알립니다.
        	        case "DESC":
        	            model.addAttribute("order", "ASC");
        	            break;
        	    }
        	    model.addAttribute("page", page);
        	    model.addAttribute("reviewsList", reviewsList);

        	    // 마지막 페이지로 이동하는 경우 파라미터 값도 같이 변경합니다.
        	    if (page > totalPage) {
        	        // 마지막 페이지로 설정합니다.
        	        page = totalPage;
        	        // 파라미터 값을 변경합니다.
        	        map.put("begin", pageUtil.getBegin());
        	        map.put("end", pageUtil.getEnd());
        	    }
        	}
        	
         */   
          	
          	
       /* @Override
          	public void getReviewsListUsingSearch(HttpServletRequest request, Model model) {
                  // 파라미터 column이 전달되지 않는 경우 column=""로 처리한다. (검색할 칼럼)
                  Optional<String> opt5 = Optional.ofNullable(request.getParameter("searchColumn"));
                  String searchColumn = opt5.orElse("");
                  
                  // 파라미터 query가 전달되지 않는 경우 query=""로 처리한다. (검색어)
                  Optional<String> opt6 = Optional.ofNullable(request.getParameter("query"));
                  String query = opt6.orElse("");
                  
                  // DB로 보낼 Map 만들기(column + query)
                  Map<String, Object> map = new HashMap<String, Object>();
                  map.put("searchColumn", searchColumn);
                  map.put("query", query);
                  
                  
                  
                  // 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
                  Optional<String> opt3 = Optional.ofNullable(request.getParameter("page"));
                  int page = Integer.parseInt(opt3.orElse("1"));
                  
                  
                  
                  // column과 query를 이용해 검색된 레코드 개수를 구한다.
                  int totalRecord = reviewsMapper.getReviewsSearchCount(map);
                  
                  // recordPerPage=10으로 처리한다.
                  int recordPerPage = 10;
        
                  // PageUtil(Pagination에 필요한 모든 정보) 계산하기
                  pageUtil.setPageUtil(page, totalRecord, recordPerPage);
                  
                  // DB로 보낼 Map에 begin, end 추가하기
                  map.put("begin", pageUtil.getBegin());
                  map.put("end", pageUtil.getEnd());
                  
                  // begin ~ end 사이의 목록 가져오기
                  List<ReviewsDTO> reviewsList = reviewsMapper.getReviewsListUsingSearch(map);
                  
                  // search.jsp로 전달할(forward)할 정보 저장하기
                  model.addAttribute("reviewsList", reviewsList);
                  model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/employees/search.do?searchColumn=" + searchColumn + "&query=" + query));
                  model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
          	  
          	}
        */
        @Override
        public Map<String, Object> getAutoComplete(HttpServletRequest request) {
          // 파라미터 column이 전달되지 않는 경우 column=""로 처리한다. (검색할 칼럼)
          Optional<String> opt1 = Optional.ofNullable(request.getParameter("searchColumn"));
          String searchColumn = opt1.orElse("");
          
          // 파라미터 query가 전달되지 않는 경우 query=""로 처리한다. (검색어)
          Optional<String> opt2 = Optional.ofNullable(request.getParameter("query"));
          String query = opt2.orElse("");
          
          // DB로 보낼 Map 만들기(column + query)
          Map<String, Object> map = new HashMap<String, Object>();
          map.put("searchColumn", searchColumn);
          map.put("query", query);
          
          // 검색 결과 목록 가져오기
          List<ReviewsDTO> reviewsList = reviewsMapper.getAutoComplete(map);
          
          // search.jsp로 응답할 데이터
          Map<String, Object> resultMap = new HashMap<String, Object>();
          resultMap.put("reviewsList", reviewsList);
          
          // 응답
          return resultMap;
        }
        
        
          

}