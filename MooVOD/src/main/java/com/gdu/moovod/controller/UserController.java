package com.gdu.moovod.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gdu.moovod.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired // MemberService 가져다 쓰기위해서
	private UserService userService;

	// 회원가입 페이지

	@GetMapping("/join")
	public String showJoinForm() {
	    return "user/join";
	}
	
	
	
	 // 로그인 페이지

	@GetMapping("/login")
	public String showLoginForm() {
	    return "user/login";
	}
	
	  @GetMapping("/leave.do")
	  public void leave(HttpServletRequest request, HttpServletResponse response) {
	    // 로그인이 되어 있는지 확인
	    userService.leave(request, response);
	  }
	  
	  @GetMapping("/wakeup.form")
	  public String wakeup() {
	    return "user/wakeup";
	  }
	  
	  @GetMapping("/restore.do")
	  public void restore(HttpSession session) {
	    // 복원할 회원의 아이디를 sysout으로 출력해 보시오.
	    System.out.println(session.getAttribute("sleepUserId"));
	  }
	
	// 마이 페이지
	/*
	 * @GetMapping(val"/mypage") public String showMyForm(HttpServletRequest
	 * request, HttpServletResponse response) { return "user/mypage"; }
	 */
	
	@GetMapping("/mypage.form")
	public String showMyForm(HttpSession session, Model model) {
		
		HttpSession sessi
		
		return "user/mypage";
	}
	

}
