package com.gdu.moovod.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDTO {
	private int itemId;
	private String itemName;
	private int itemPrice;
	private String itemInfo;
	private String itemImg;
}

