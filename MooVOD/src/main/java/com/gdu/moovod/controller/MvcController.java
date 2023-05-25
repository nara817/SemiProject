package com.gdu.moovod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {

  // 겟맵핑 하는 곳에 ("/) 같은 경로가 올 수 없어서 분리.
  
	@GetMapping("/") 
	public String welcome() {
		return "index";
	}
	
	
	 @GetMapping("/main")
	  public String main() {
	    return "main";
	  }
	
}
