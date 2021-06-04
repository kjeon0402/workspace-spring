package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/form")
public class FormController {
		
	@GetMapping("")	// prefix + "/form" + "" + suffix = /WEB-INF/views/form.jsp
	public void form() {}
	
	@GetMapping("/ex01")	// /WEB-INF/view/form/ex01.jsp
	public void ex01() {}
	
	@PostMapping("/ex01")
	public ModelAndView ex01(int n1, char oper, int n2) {
		ModelAndView mav = new ModelAndView("form/ex01Result");
		int answer = 0;
		switch(oper) {
			case '+': answer = n1 + n2; break;
			case '-': answer = n1 - n2; break;
			case '*': answer = n1 * n2; break;
			case '/': answer = n1 / n2; break;
		}
		String result = String.format("%d %c %d = %d\n", n1, oper, n2, answer);
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("/ex02")
	public void ex02() {}
	
	@PostMapping("/ex02")
	public ModelAndView ex02(Ex02DTO dto) {
		ModelAndView mav = new ModelAndView("form/ex02Result");
		String result = String.format("%s님은 %d살입니다.", dto.getName(), dto.getAge());
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("/ex03")
	public void ex03() {}
	
	@PostMapping("/ex03")
	public ModelAndView ex03(String[] name, int[] age) {	// request.getParameterValues();
		
//		System.out.println(name);
//		System.out.println(age);
		
//		for(String n : name)  System.out.println(n);
//		for(int a : age)  System.out.println(a);
		
		Ex02DTO[] arr = new Ex02DTO[name.length];	// 배열을 생성할 때 길이 혹은 요소가 필요하다
		for(int i = 0; i < arr.length; i++) {
			Ex02DTO dto = new Ex02DTO();		// 비어 있는 객체 생성
			dto.setName(name[i]);				// 순서대로 파라미터의 이름을 객체의 이름에 저장
			dto.setAge(age[i]);					// 순서대로 파라미터의 나이를 객체의 나이에 저장
			arr[i] = dto;						// 값이 준비된 객체를 배열에 대입
		}
		for(Ex02DTO dto : arr) {				// 준비된 배열의 각 객체를 
			System.out.println(dto);			// 시스템 콘솔 화면에 출력
		}
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("/ex04")
	public void ex04() {}
	
	@PostMapping("/ex04")
	public ModelAndView ex04(Ex04DTO wrapping) {
		// Ex04DTO가 직접 작성한 클래스이므로, 파라미터를 직접 대입하지 않고, 내부 멤버필드를 찾아서 대입
		// 내부 멤버필드는 List<Ex02DTO> list이므로
		// list에 값을 넣기 위해서는, index가 필요하다
		// list[i]의 자료형이 Ex02DTO이므로
		// Ex02DTO의 멤버필드 이름이 <input>의 이름과 일치하면 파라미터를 대입한다
		
		// 스프링 커맨드 객체는 내부 멤버필드의 컬렉션 형식을 지원한다
		
		System.out.println(wrapping);
		
		// service.insert(wrapping.getList());	// wrapping 객체가 아니라, 내부 리스트를 전달하자
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
