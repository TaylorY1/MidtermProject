package com.skilldistillery.fursurance.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.fursurance.data.PetDAO;
import com.skilldistillery.fursurance.data.QuoteDAO;
import com.skilldistillery.fursurance.data.UserDAO;
import com.skilldistillery.fursurance.entities.Address;
import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.PetVaccination;
import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private QuoteDAO quoteDao;
	
	@Autowired
	private PetDAO petDao;

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
			}
		});
		// 2020-11-04T09:44
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		// model.addAttribute("DEBUG", userDao.findById(1));
		return "index";
	}

	@RequestMapping("getQuote.do")
	public String getQuote(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		
		if (user != null) {
			
			List<MedicalCondition> conditions = petDao.getConditions();
			model.addAttribute("conditions", conditions);
			
			List<PetVaccination> vaccinations = petDao.getVaccinations();
			model.addAttribute("vaccinations", vaccinations);
			
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
	public String createQuote(Quote quote, Model model, int[] conditions, int[] vaccinations, HttpSession session) {
		System.out.println(conditions[0]);
		System.out.println("********************");
		System.out.println(vaccinations[0]);
		User user = (User) session.getAttribute("user");
		
		
		if (user != null) {
			quote.setUser(user);
			quote.getPet().setUser(user);
			
			List<MedicalCondition> conditionsForPet = new ArrayList<>();
			for (int i : conditions) {
				conditionsForPet.add(petDao.getCondition(i));
			}
			
			List<PetVaccination> vaccinationsForPet = new ArrayList<>();
			for (int i : vaccinations) {
				vaccinationsForPet.add(petDao.getVaccination(i));
			}
			
			quoteDao.createQuote(quote, conditionsForPet, vaccinationsForPet);
			model.addAttribute("quote", quote);
			return "showQuotes";

		} else {
			return "login";
		}

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
			return "redirect:getQuote.do";
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
			if (successful) {
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

	@RequestMapping(path={"account.do","account"})
	public String account(HttpSession session, Model model) {
		User temp = (User) session.getAttribute("user");
		if (temp.getUsername().equalsIgnoreCase("admin")) {
			List<Quote> allQuotes = quoteDao.findAll();
			List<User> allUsers = userDao.findAll();
			model.addAttribute("allUsers", allUsers);
			model.addAttribute("allQuotes", allQuotes);
			return "account";
		} else {
			List<Quote> quotes = userDao.findQuoteByUser(temp);
			model.addAttribute("quotes", quotes);
			return "account";
		}
	}

	@RequestMapping(path={"update.do"})
	public String update(HttpSession session, Model model, @RequestParam int quoteId) {
		Quote temp = quoteDao.findById(quoteId);
		model.addAttribute("quoteToUpdate", temp);

		return "updateQuote";
	}

	@RequestMapping("delete.do")
	public String delete(HttpSession session, @RequestParam int quoteId, Model model) {
		Quote temp = quoteDao.findById(quoteId);

		boolean successful = quoteDao.deleteById(temp);
		return "redirect:account.do";

	

		
	}
	@RequestMapping(path = "updatequote.do", method = RequestMethod.POST)
	public String updateQuote(Quote quote, @RequestParam int quoteId) {
		Quote updated = quoteDao.update(quoteId, quote);
		
		return "redirect:account.do";
	}
}