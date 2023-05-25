package com.gdu.moovod.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.ItemCartDTO;

@Mapper
public interface ItemCartMapper {
	public List<ItemCartDTO> getItemCartList(String id);					// 장바구니 목록
	public ItemCartDTO getItemCartById(String id);
	public int insertItemCart(ItemCartDTO itemCart);
	public int updateItemCart(ItemCartDTO itemCart);
	public int deleteItemCart(int cartID);
	public int deleteItemCartList(List<String> userId);
	
	
}