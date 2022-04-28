package com.skilldistillery.fursurance.data;

import java.util.List;

import com.skilldistillery.fursurance.entities.Address;
import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.User;

public interface UserDAO {
	
	User findById(int userId);

	User findByCredentials(String username, String password);

	User findByFullName(String firstName, String lastName);

	boolean addUser(User user, Address address);

	List<Quote> findQuoteByUser(User temp);

	List<User> findAll();

	List<Pet> findPetByUser(User temp);

}
