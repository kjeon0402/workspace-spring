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

	@Autowired
	private ProductService ps;

	@GetMapping({ "/", "" })
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("home");
		List<ProductDTO> list = ps.selectList();
		mav.addObject("list", list);
		return mav;
	}

	@PostMapping({ "/", "" })
	public String sell(ProductList list) {
		int row = ps.insertRevenue(list.getList());
		return "redirect:/";
	}

	@GetMapping("/insert")
	public String insert() {
		return "insert";
	}

	@PostMapping("/insert")
	public String insert(ProductDTO dto) {
		int row = ps.insertProduct(dto);
		return "redirect:/";
	}

	@GetMapping("/update")
	public ModelAndView update(ModelAndView mav) {
		mav.setViewName("update");
		List<ProductDTO> list = ps.selectList();
		mav.addObject("list", list);
		return mav;
	}
	
//	@GetMapping("/update")
//	public String update() {
//		return "update";
//	}

	@PostMapping("/update")
	public String update(ProductList list) {
		int row = ps.updateProduct(list.getList());
		return "redirect:/";
	}
	
	@GetMapping("/revenue")
	public ModelAndView revenue(ModelAndView mav) {
		mav.setViewName("revenue");
		List<RevenueDTO> list = ps.selectRevenueList();
		mav.addObject("list", list);
		return mav;
	}
}
