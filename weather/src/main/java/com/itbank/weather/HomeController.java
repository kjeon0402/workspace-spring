package com.itbank.weather;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.service.WeatherService;

@Controller
public class HomeController {
	
	@Autowired private WeatherService ws;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/weather")
	@ResponseBody
	public String weather() throws Exception {
		String json = ws.getWeatherJSON();
		System.out.println(json);
		return json;
	}
}
