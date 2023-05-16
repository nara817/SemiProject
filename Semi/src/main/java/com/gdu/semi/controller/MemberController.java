package com.gdu.semi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gdu.semi.domain.MemberDTO;
import com.gdu.semi.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired // MemberService 가져다 쓰기위해서
	private MemberService memberService;

	// 회원가입 페이지
   // @RequestMapping(value = "/join", method = RequestMethod.POST)
//    public String createMember(MemberDTO memberDTO){
  //  public String join(MemberDTO memberDTO) throws Exception{
 //       memberService.memberJoin(memberDTO);
  //      return "redirect:member/join";
  //  }
	@GetMapping("/join")
	public String showJoinForm() {
	    return "member/join";
	}
	
	
	
	 // 로그인 페이지
	  /*
	 @RequestMapping(value = "/login", method = RequestMethod.GET) public String
	 login(MemberDTO memberDTO) throws Exception{
	 memberService.memberLogin(memberDTO); return "redirect:/login"; } */
	@GetMapping("/login")
	public String showLoginForm() {
	    return "member/login";
	}
	
	

}
