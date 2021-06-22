package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.PhoneBookDTO;
import com.itbank.service.MemberService;

@RestController
@RequestMapping("/phonebook")		
public class AjaxController {
	
	@Autowired private MemberService ms;
	private ObjectMapper mapper = new ObjectMapper();
	
	@GetMapping("/")				// const opt = {method: 'GET'}
	public String select() {
		return "";
	}
	
	@GetMapping(value="/{name}", produces="application/json; charset=utf-8")			// const opt = {method: 'GET'}
	public String select(@PathVariable String name) throws JsonProcessingException {
		PhoneBookDTO dto = ms.search(name);
		String data = mapper.writeValueAsString(dto);
		return data;
	}
	
	@PostMapping("/")				// const opt = {method: 'POST'}
	public int insert(PhoneBookDTO dto) {
		return ms.insert(dto);
	}
	
	@DeleteMapping("/{name}/")		// const opt = {method: 'DELETE'}
	public int delete(@PathVariable String name) {
		return 0;
	}
	
	@PutMapping("/{name}/") 		// const opt = {method: 'PUT'}
	public int update(PhoneBookDTO dto) {
		return 0;
	}
}
