package com.gdu.moovod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {
<<<<<<< HEAD

	@GetMapping(value = {"/", "/index.do"})
=======
	// 메인페이지
	@GetMapping(value={"/", "/index.do"})
>>>>>>> kim
	public String welcome() {
		return "index";
	}
	
}
