package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.moovod.domain.ItemCartDTO;

public interface ItemCartService {
	public List<ItemCartDTO> getItemCartList(String id);
	public ItemCartDTO getItemCartById(HttpServletRequest request);
	public void addItemCart(HttpServletRequest request, HttpServletResponse response);
	public void modifyItemCart(HttpServletRequest request, HttpServletResponse response);
	public void removeItemCart(HttpServletRequest request, HttpServletResponse response);
	public void removeItemCartList(HttpServletRequest request, HttpServletResponse response);
	
}
