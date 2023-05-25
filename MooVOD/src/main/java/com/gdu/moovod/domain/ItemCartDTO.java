package com.gdu.moovod.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemCartDTO {
	private int cartId;
	private String id;
	private int itemId;
	private int amount;
	
	// item
	private String itemName;
	private int itemPrice;
	private int total;
	
}

