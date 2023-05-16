package com.gdu.semi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.semi.domain.UserDTO;
import com.gdu.semi.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired // MemberService 가져다 쓰기위해서
	private UserService userService;
	
	// 회원가입 페이지
	/*
	@GetMapping("/join.form")
	public String joinForm(@RequestParam(value="location", required=false) String location  // 파라미터 location이 전달되지 않으면 빈 문자열("")이 String location에 저장된다.
	                       , @RequestParam(value="event", required=false) String event        // 파라미터 event가 전달되지 않으면 빈 문자열("")이 String event에 저장된다.
	                       , Model model) {
	  model.addAttribute("location", location);
	  model.addAttribute("event", event);
	  return "user/join";
	  }*/
    
	
	 // 로그인 페이지
	@GetMapping("/login")
	public String showLoginForm() {
	    return "user/login";
	}
	
	
	

}
