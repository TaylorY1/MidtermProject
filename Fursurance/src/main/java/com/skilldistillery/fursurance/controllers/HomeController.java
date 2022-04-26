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
		//model.addAttribute("DEBUG", userDao.findById(1));
		return "index";
	}

	@RequestMapping("getQuote.do")
	public String getQuote(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.out.println("++++++");
		System.out.println(user);
		if (user != null) {
			return "quoteRequest";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = { "showQuotes.do" })
	public String listAll(Model model) {
		List<Quote> quotes = quoteDao.findAll();
		model.addAttribute("quotes", quotes);

		return "showQuotes"; // session determines which view
	}

	@RequestMapping(path = "createQuote.do", method = RequestMethod.POST)
	public String createQuote(Quote quote, Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user != null) {
			quote.setUser(user);
			quoteDao.createQuote(quote);
			model.addAttribute("quote", quote);
			return "showQuotes";

		} else {
			return "login";
		}

	}

//Why is this method here?
	public String createQuote(Quote quote, Model model) {
		quoteDao.createQuote(quote);
		model.addAttribute("quote", quote);
		return "showQuotes";
	}



	@RequestMapping("login.do")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String checkUser(@RequestParam String username, @RequestParam String password, HttpSession session) {
		User managed = userDao.findByCredentials(username, password);
		if (managed != null) {
			session.setAttribute("user", managed);
			return "quoteRequest";
		}
		return "login";
	}


	@RequestMapping("register.do")
	public String register(HttpSession session, User user, Address address) {
		User managed = userDao.findByFullName(user.getFirstName(), user.getLastName());
		if (managed != null) {
			// Give alert that profile already exists 
			return "login";
		} else {
			
			boolean successful = userDao.addUser(user, address);
			if(successful) {
				User persistedUser = userDao.findByFullName(user.getFirstName(), user.getLastName());
				session.setAttribute("user", persistedUser);
				return "account";
			}
			return "login";
		}
	}
	
	@RequestMapping("logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return "index";
	}
	
	@RequestMapping("account.do")
	public String account(HttpSession session, Model model) {
		User temp = (User) session.getAttribute("user");
		if(temp.getUsername().equalsIgnoreCase("admin")) {
			List<Quote> allQuotes = quoteDao.findAll();
			List<User> allUsers = userDao.findAll();
			model.addAttribute("allUsers", allUsers);
			model.addAttribute("allQuotes", allQuotes);
			return "account";
		}else {
			List<Quote> quotes = userDao.findQuoteByUser(temp);
			model.addAttribute("quotes", quotes);
			return "account";
		}
	}
	
	@RequestMapping("update.do")
	public String update(HttpSession session, Model model, @RequestParam int quoteId) {
		Quote temp = quoteDao.findById(quoteId);
		model.addAttribute("quoteToUpdate", temp);
		return "updateQuote";
	}
	
	@RequestMapping("delete.do")
	public String delete(HttpSession session, @RequestParam int quoteId) {
		Quote temp = quoteDao.findById(quoteId);
		boolean succsessful = quoteDao.deleteById(temp);
		return "account";
		
	}
	@RequestMapping(path = "updatequote.do", method = RequestMethod.POST)
	public String updateQuote(Quote quote, @RequestParam int quoteId) {
		Quote updated = quoteDao.update(quoteId, quote);
		
		return "account";
	}
}