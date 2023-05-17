package com.gdu.moovod.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	// 마이 페이지
	@GetMapping("/mypage")
	public String showMyForm() {
	    return "user/mypage";
	}
	

}
