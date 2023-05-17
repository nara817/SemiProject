package com.gdu.moovod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {
	// 메인페이지
	@GetMapping("/")
	public String mainPage() {
		return "main";
	}
	
}