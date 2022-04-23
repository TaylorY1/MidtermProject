package com.skilldistillery.fursurance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.fursurance.data.UserDAO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping( path = {"/", "home.do"} )
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findById(1));
		return "index";
	}
	
	@RequestMapping("getQuote.do")
	public String getQuote(Model model) {
		return "quoteRequest";
	}
	
	
	
	
	

}



