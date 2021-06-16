package com.itbank.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dto.OrderDTO;
import com.itbank.dto.PersonDTO;
import com.itbank.dto.ReserveDTO;
import com.itbank.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@GetMapping("/service_list_all")
	public ModelAndView ListAll() {
		ModelAndView mav = new ModelAndView("/order/list");
		List<OrderDTO> list = os.selectall();
		mav.addObject("list", list);
		return mav;
	}
	
	@Autowired OrderService os;
	
	@GetMapping("/statusList")
	public ModelAndView registList(@RequestParam String status) {
		ModelAndView mav = new ModelAndView("/order/list");
		List<OrderDTO> list = os.selectStatus(status);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/order_new")
	public String orderNew() {
		return "/order/order_new";
	}
	
	@PostMapping("/order_new")
	public ModelAndView order(OrderDTO dto) {
		ModelAndView mav = new ModelAndView("/order/order_result");
		String msg;
		int row = os.order(dto);
		if(row != 0) {
			msg = "주문이 접수되었습니다";
		}
		else {
			msg = "주문 접수에 실패했습니다. 다시 시도해주세요";
		}
		mav.addObject("msg", msg);
		return mav;
	}
	
	@GetMapping("/select/{idx}")
	public ModelAndView read(@PathVariable int idx, String value) {
		ModelAndView mav = new ModelAndView("/order/" + value);
		OrderDTO dto = os.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/select/{idx}")
	public ModelAndView modify(@PathVariable int idx, OrderDTO dto) {
		String msg;
		dto.setService_idx(idx);
		int row = os.modify(dto);
		if(row != 0) {
			msg = "수정이 완료되었습니다";
		}
		else {
			msg = "수정에 실패했습니다. 다시 시도해주세요";
		}
		ModelAndView mav = new ModelAndView("/order/order_result");
		mav.addObject("msg", msg);
		mav.addObject("value", "modify");
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable int idx) {
		int row = os.delete(idx);
		String msg;
		if(row != 0) {
			msg = "삭제가 완료되었습니다";
		}
		else {
			msg = "삭제에 실패했습니다. 다시 시도해주세요";
		}
		ModelAndView mav = new ModelAndView("/order/order_result");
		mav.addObject("msg", msg);
		mav.addObject("value", "delete");
		return mav;
	}
	
	@GetMapping("/order_new_for_cust")
	public ModelAndView order_new_for_cust() {
		ModelAndView mav = new ModelAndView("/order/order_new_for_cust");
		
//		HashMap<String, Object> map = os.complicateJob();
//		
//		mav.addObject("aMap", map.get("aMap"));
//		mav.addObject("engiIdList", map.get("engiIdList"));
//		mav.addObject("monthList", map.get("monthList"));
//		mav.addObject("dayList", map.get("dayList"));
		
		return mav;
	}
	
//	@PostMapping("/order_new_for_cust")
//	public ModelAndView order_new_for_cust(OrderDTO orderDTO, ReserveDTO reserveDTO) {
//		ModelAndView mav = new ModelAndView("/order/order_result");
//		int row = os.order(orderDTO);
//		int row2 = os.setReserve(reserveDTO);
//		String msg;
//		if(row != 0) {
//			msg = "주문이 접수되었습니다";
//		}
//		else {
//			msg = "주문 접수에 실패했습니다. 다시 시도해주세요";
//		}
//		mav.addObject("msg", msg);
//		
//		return mav;
//	}

}
