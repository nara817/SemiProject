package com.gdu.moovod.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.moovod.service.ItemCartService;

@Controller
@RequestMapping("/item")
public class ItemCartController {

	@Autowired
	private ItemCartService itemCartService;
	
	@GetMapping("/cartlist.do")
	public String list(Model model) {
	  String id = "pks";
		model.addAttribute("itemCart", itemCartService.getItemCartList(id));
		return "item/cart";
	}
	
	@PostMapping("/addcart.do")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		itemCartService.addItemCart(request, response);
	}
	
	@PostMapping("/modify.do")
	public void modify(HttpServletRequest request, HttpServletResponse response) {
		itemCartService.modifyItemCart(request, response);
	}
	
	@PostMapping("/remove.do")
	public void remove(HttpServletRequest request, HttpServletResponse response) {
		itemCartService.removeItemCart(request, response);
	}

	@PostMapping("/removeList.do")
	public void removeList(HttpServletRequest request, HttpServletResponse response) {
		itemCartService.removeItemCartList(request, response);
	}
	
	
}
