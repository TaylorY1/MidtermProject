package com.skilldistillery.fursurance.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.fursurance.data.QuoteDAO;
import com.skilldistillery.fursurance.data.UserDAO;
import com.skilldistillery.fursurance.entities.Address;




import com.skilldistillery.fursurance.entities.Pet;

import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private QuoteDAO quoteDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findById(1));
		return "index";
	}

	@RequestMapping("getQuote.do")
	public String getQuote(Model model) {
		return "quoteRequest";
	}

	@RequestMapping(path = { "showQuotes.do" })
	public String listAll(Model model) {
		List<Quote> quotes = quoteDao.findAll();
		model.addAttribute("quotes", quotes);

		return "showQuotes"; //session determines which view
	}
	
	@RequestMapping(path = "createQuote.do", method = RequestMethod.POST)
	public String createQuote(Quote quote, Model model) {
		quoteDao.createQuote(quote);
		model.addAttribute("quote", quote);
		return "showQuotes";
	}
	
//	@RequestMapping(path = "createQuotes.do", method = RequestMethod.POST) //dealing with gold/silver/bronze
//	public String createQuotes(List<Quote> quotes, Model model) {
//		List<Quote> quotesCreated = null;
//		Quote quote = null;
//		
//		Quote bronze = quoteDao.create(quote);
//		Quote silver = quoteDao.create(quote);
//		Quote gold = quoteDao.create(quote);
//		
//		quotes.add(bronze);
//		quotes.add(silver);
//		quotes.add(gold);
//		
//		model.addAttribute("quotes", quotes);
//		return "showQuotes";
//	}
	
	
	
	

}


	@RequestMapping("login.do")
	public String login(Model model) {
		return "logIn";
	}
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String checkUser(@RequestParam String username, @RequestParam String password,  HttpSession session) {
		User managed = userDao.findByCredentials(username, password);
		if (managed != null) {
			session.setAttribute("user", managed);
			return "quoteRequest";
		}
		return "login";	
	}

	@RequestMapping("registration.do")
	public String register(HttpSession session, User user, Address address ) {
		System.out.println(user);
		System.out.println(address);
		return "account";
	}

}
