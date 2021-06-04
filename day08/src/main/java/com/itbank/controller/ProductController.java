package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ProductDTO;
import com.itbank.model.ProductList;
import com.itbank.model.RevenueDTO;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired ProductService ps;
	
	@GetMapping("/order")
	public ModelAndView order(ModelAndView mav) {
		List<ProductDTO> list = ps.orderList();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/order")
	public String sell(ProductList list) {
		int row = ps.insertRevenue(list.getList());
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public ModelAndView update(ModelAndView mav) {
		List<ProductDTO> list = ps.orderList();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/update")
	public String update(ProductList list) {
		int row = ps.updateProduct(list.getList());
		return "redirect:/";
	}
	
	@GetMapping("/revenue")
	public ModelAndView revenue(ModelAndView mav) {
		List<RevenueDTO> list = ps.selectRevenueList();
		mav.addObject("list", list);
		return mav;
	}
}
