package com.gdu.moovod.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.ItemDTO;

@Mapper
public interface ItemMapper {
	public List<ItemDTO> getItemList();
	public ItemDTO getItemByNo(int itemId);
		
}