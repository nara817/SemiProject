package com.gdu.moovod.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.ItemDTO;
import com.gdu.moovod.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	@Override
	public List<ItemDTO> getItemList() {
		return itemMapper.getItemList();
	}
	
	@Override
	public ItemDTO getItemByNo(HttpServletRequest request) {
		String strItemId = request.getParameter("itemId");
		int itemId=0;
		itemId = Integer.parseInt(strItemId);
		System.out.println(itemId);
		return itemMapper.getItemByNo(itemId);
	}
}
