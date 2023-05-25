package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.moovod.domain.ItemDTO;

public interface ItemService {
	public List<ItemDTO> getItemList();
	public ItemDTO getItemByNo(HttpServletRequest request);
}
