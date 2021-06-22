package com.itbank.controller;

import java.util.HashMap;

public class Test {

	public static void main(String[] args) {
		HashMap<String, String> formData = new HashMap<String, String>();
		
		formData.put("userid", "test");
		formData.put("userpw", "1234");
		formData.put("username", "테스트");
		
		System.out.println(formData);
		
		for(String key : formData.keySet()) {	// key와 value 쌍에서 key들만 추출하여 가져오기
			System.out.println(key + " : " + formData.get(key));
		} System.out.println();
		
//		for(String value : formData.keySet()) {
//			System.out.println(value);
//		} System.out.println();
	}
}
