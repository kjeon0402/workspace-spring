package com.itbank.verlin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.verlin.model.QnaProductDTO;
import com.itbank.verlin.model.ReviewDTO;
import com.itbank.verlin.model.addressDTO;
import com.itbank.verlin.model.categoryDTO;
import com.itbank.verlin.model.detailDTO;
import com.itbank.verlin.model.homeProductDTO;
import com.itbank.verlin.model.MemberTestDTO;
import com.itbank.verlin.model.productDTO;
import com.itbank.verlin.service.QnaService;
import com.itbank.verlin.service.ReviewService;
import com.itbank.verlin.service.TestService;
import com.itbank.verlin.service.addressService;
import com.itbank.verlin.service.categoryService;
import com.itbank.verlin.service.detailCutService;
import com.itbank.verlin.service.homeProductService;
import com.itbank.verlin.service.MemberTestService;
import com.itbank.verlin.service.productService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class TestController {
	
	@Autowired private TestService ts;
	@Autowired private productService ps;
	@Autowired private ReviewService rs;
	@Autowired private QnaService qs;
	@Autowired private homeProductService hps;
	@Autowired private MemberTestService ms;
	@Autowired private addressService as;
	@Autowired private categoryService cts;
	@Autowired private detailCutService ds;
	
//	홈 / 대분류 / 상세
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		
		List<homeProductDTO> hpdto = hps.selectProductForHome();
		List<ReviewDTO> list = rs.reviewListForHome();
		mav.addObject("totalProduct", hpdto);
		mav.addObject("review", list);
		return mav;
	}
	
	@GetMapping("/product/bigCategory/{option_category}")
	public ModelAndView bigCategory(@PathVariable String option_category) {
		ModelAndView mav = new ModelAndView("product/bigCategory");
		
		List<homeProductDTO> hpdto = hps.selectProductForCategory(option_category);
		List<categoryDTO> cdto = cts.selectProductOptionOptionCategory(option_category);
		List<homeProductDTO> todaydto = hps.selectProductForTodayItem();
		mav.addObject("product", hpdto);
		mav.addObject("innerCategoryName", cdto);
		mav.addObject("todayItem", todaydto);
		return mav;
	}
	@GetMapping("/product/productIcon/{product_icon}")
	public ModelAndView productIcon(@PathVariable String product_icon) {
		ModelAndView mav = new ModelAndView("product/bigCategory");
		
		List<homeProductDTO> hpdto = hps.selectProductForProductIcon(product_icon);
//		List<categoryDTO> cdto = cts.selectProductOptionOptionCategory(option_category);
		List<homeProductDTO> todaydto = hps.selectProductForTodayItem();
		mav.addObject("product", hpdto);
//		mav.addObject("innerCategoryName", cdto);
		mav.addObject("todayItem", todaydto);
		return mav;
	}
	
	@GetMapping("/product/bigCategory/{option_category}/{option_innercategory}")
	public ModelAndView bigCategory(@PathVariable String option_category, @PathVariable String option_innercategory) {
		ModelAndView mav = new ModelAndView("product/bigCategory");
		
		List<homeProductDTO> hpdto = hps.selectProductForInnerCategory(option_category, option_innercategory);
		List<categoryDTO> cdto = cts.selectProductOptionOptionCategory(option_category);
		List<homeProductDTO> todaydto = hps.selectProductForTodayItem();
		mav.addObject("product", hpdto);
		mav.addObject("innerCategoryName", cdto);
		mav.addObject("todayItem", todaydto);
		return mav;
	}
	
//	반환값 변경 및 반환클래스 수정해야함
//	@GetMapping(value="/product/bigCategory/{bigCategoryName}/{sort}", produces="application/text;charset=utf8")
//	@ResponseBody
//	public String sortCategory(@PathVariable String bigCategoryName, @PathVariable String sort) {
//		
//		return "작동됨";
//	}
	
	@GetMapping("/product/search")
	public String productSearch() {
		return "product/product_search";
	}
	
	@PostMapping("/product/search")
	public ModelAndView productSearch(String searchProduct) {
		ModelAndView mav = new ModelAndView("product/product_search");
		List<homeProductDTO> hpdto = hps.selectProductForSearch(searchProduct);

		int searchProductCount = 1;
		if(hpdto.size() == 0) {
			searchProductCount = 0;
		}
		for(int i = 0; i < hpdto.size() - 1; i++) {
			if(hpdto.get(i).getProduct_id() != hpdto.get(i + 1).getProduct_id()) {
				searchProductCount++;
			}
		}
		if(searchProduct == "") {
			searchProductCount = 0;
			mav.addObject("searchProductCount", searchProductCount);
			return mav;
		}
		mav.addObject("searchProduct", hpdto);
		mav.addObject("searchProductCount", searchProductCount);
		return mav;
	}
	
	
	@GetMapping("/product/detailProduct/{product_id}")
	public ModelAndView product(@PathVariable int product_id) {
		ModelAndView mav = new ModelAndView("product/product");
		
		List<productDTO> dtoList = ps.selectProduct(product_id);
		List<ReviewDTO> list = rs.reviewListInDetailProduct(product_id);
		int listSize = list.size();
		List<QnaProductDTO> qnaList = qs.selectBoardQna(product_id);
		int qnaSize = qnaList.size();
		
		List<detailDTO> detaildto = ds.selectDetailCut(product_id);
		mav.addObject("detail", detaildto);
		float starAverage = 0;
		int fiveStar = 0;
		int fourStar = 0;
		int threeStar = 0;
		int twoStar = 0;
		int oneStar = 0;
		for(int i = 0; i < list.size(); i++) {
			starAverage += list.get(i).getStar();
			switch(list.get(i).getStar()) {
			case 1: oneStar++; break;
			case 2: twoStar++; break;
			case 3: threeStar++; break;
			case 4: fourStar++; break;
			case 5: fiveStar++; break;
			}
		}
		
		int totalStar = oneStar + twoStar + threeStar + fourStar + fiveStar;
		mav.addObject("oneStar", oneStar);
		mav.addObject("twoStar", twoStar);
		mav.addObject("threeStar", threeStar);
		mav.addObject("fourStar", fourStar);
		mav.addObject("fiveStar", fiveStar);
		mav.addObject("totalStar", totalStar);
		
		String starPoint;
		if(starAverage == 0) {
			starPoint = "0";
		} else {
			starPoint = String.format("%.1f", starAverage / list.size()); 
		}
		
		mav.addObject("product", dtoList);
		mav.addObject("review", list);
		mav.addObject("listSize", listSize);
		mav.addObject("qnaList", qnaList);
		mav.addObject("qnaSize", qnaSize);
		mav.addObject("starAverage", starPoint);
		return mav;
	}
	
	@GetMapping("product/detailProduct/detailImg/{product_id}")
	public ModelAndView detailImg(@PathVariable int product_id) {
		ModelAndView mav = new ModelAndView("product/detailImg");
		List<productDTO> dtoList = ps.selectProduct(product_id);
		mav.addObject("product", dtoList);
		return mav;
	}
	
	
//	결제페이지
	@GetMapping("/order")
	public String order() {
		return "order";
	}
	@PostMapping("/order")
	public ModelAndView order(productDTO dto) {
		ModelAndView mav = new ModelAndView("order");
		MemberTestDTO mdto = ms.selectMember(); 
	
		mav.addObject("mdto", mdto);
		mav.addObject("dto", dto);
		
		return mav;
	}	
	
	@GetMapping("/popupAddress")
	public ModelAndView popupAddress() {
		ModelAndView mav = new ModelAndView("popupAddress");
		List<addressDTO> list = as.selectAddress();
		
		mav.addObject("list", list);
		return mav;
	}
	@PostMapping("/popupAddress")
	public ModelAndView popupAddress(addressDTO adto) {
		ModelAndView mav = new ModelAndView("popupAddress");
		int row = as.insertAddress(adto);		
		List<addressDTO> list = as.selectAddress();
		
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/popupAddressRegister")
	public ModelAndView popupAddressRegister() {
		ModelAndView mav = new ModelAndView("popupAddressRegister");
		return mav;
	}
	
	@GetMapping("/popupAddressModify")
	public ModelAndView popupAddressModify() {
		ModelAndView mav = new ModelAndView("popupAddressModify");
		List<addressDTO> list = as.selectAddress();
		
		mav.addObject("list", list);
		
		return mav;
	}
	@PostMapping("/popupAddressModify")
	public String popupAddressModify(addressDTO adto) {
		
		as.modifyAddress(adto);
		
		return "redirect:/popupAddress";
	}
	
	
//	카트
	@GetMapping("/cart")
	public String cart() {
		return "member/cart";
	}
	
	@PostMapping("/cart")
	public ModelAndView cart(String value) {
		ModelAndView mav = new ModelAndView("member/cart");
		return mav;
	}
	
	@GetMapping("/cart_estimate_popup")
	public String cart_estimate_popup() {
		return "member/cart_estimate_popup";
	}
}
