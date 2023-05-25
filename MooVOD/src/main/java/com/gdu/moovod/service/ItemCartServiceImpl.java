package com.gdu.moovod.service;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.ItemCartDTO;
import com.gdu.moovod.mapper.ItemCartMapper;

@Service
public class ItemCartServiceImpl implements ItemCartService {

	@Autowired
	private ItemCartMapper itemCartMapper;
	
	@Override
	public List<ItemCartDTO> getItemCartList(String id) {
		return itemCartMapper.getItemCartList(id);
	}

	@Override
	public ItemCartDTO getItemCartById(HttpServletRequest request) {
		String id = request.getParameter("id");
		return itemCartMapper.getItemCartById(id);
	}

	@Override
	public void addItemCart(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String itemName = request.getParameter("itemName");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
		ItemCartDTO itemCart = new ItemCartDTO();
		itemCart.setId(id);
		itemCart.setItemName(itemName);
		itemCart.setAmount(amount);
		itemCart.setItemPrice(itemPrice);
		
		int addResult = itemCartMapper.insertItemCart(itemCart);
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(addResult == 1) {
				out.println("alert('장바구니에 등록되었습니다.')");
				out.println("history.back()");
			} else {
				out.println("alert('장바구니에 등록되지 않았습니다.')");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void modifyItemCart(HttpServletRequest request, HttpServletResponse response) {
		int amount = Integer.parseInt(request.getParameter("amount"));
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		
		ItemCartDTO itemCart = new ItemCartDTO();
		itemCart.setAmount(amount);
		itemCart.setCartId(cartId);
		
		int modifyResult = itemCartMapper.updateItemCart(itemCart);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			if(modifyResult == 1) {
				out.println("alert('수량이 변경되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/item/listcart.do?cartId=" + cartId + "'");
				
			} else {
			  out.println("alert('수량이 변경되지 않았습니다.')");
			  out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeItemCart(HttpServletRequest request, HttpServletResponse response) {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		int removeResult = itemCartMapper.deleteItemCart(cartId);
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == 1) {
				out.println("alert('선택하신 상품이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/item/listcart.do'");
			} else {
				out.println("alert('선택하신 상품이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeItemCartList(HttpServletRequest request, HttpServletResponse response) {
		String[] itemCartList = request.getParameterValues("itemCartList");
		int removeResult = itemCartMapper.deleteItemCartList(Arrays.asList(itemCartList));
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == itemCartList.length) {
				out.println("alert('모든 상품이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/item/listcart.do'");
			} else {
				out.println("alert('선택하신 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
