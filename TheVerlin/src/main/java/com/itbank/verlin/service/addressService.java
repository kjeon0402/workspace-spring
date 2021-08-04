package com.itbank.verlin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.addressDAO;
import com.itbank.verlin.model.addressDTO;

@Service
public class addressService {

	@Autowired private addressDAO dao;

	public int insertAddress(addressDTO adto) {
		
		int row = dao.insertAddress(adto);
	
		return row;
	}

	public List<addressDTO> selectAddress() {

		return dao.selectAddress();
	}

	public void modifyAddress(addressDTO adto) {
		
		 dao.modifyAddress(adto);
	}
	

}
