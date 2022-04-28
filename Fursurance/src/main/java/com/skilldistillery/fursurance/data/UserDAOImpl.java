package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Address;
import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {

		return em.find(User.class, userId);
	}

	@Override
	public User findByCredentials(String username, String password) {
		String query = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		User user = em.createQuery(query, User.class).setParameter("username", username)
				.setParameter("password", password).getSingleResult();
		
		return user;
	}

	@Override
	public User findByFullName(String firstName, String lastName) {
		String query = "SELECT u FROM User u WHERE u.firstName = :firstname and u.lastName = :lastname";
		List<User> users  = em.createQuery(query, User.class).setParameter("firstname", firstName)
				.setParameter("lastname", lastName).getResultList();
		if(users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	@Override
	public boolean addUser(User user, Address address) {
		// username must be unique
		user.setAddress(address);

		em.persist(address);
		em.persist(user);

		return true;
	}

	@Override
	public List<Quote> findQuoteByUser(User temp) {
		String query = "Select q from Quote q where user_id = :userid";
		List<Quote> quotes = em.createQuery(query, Quote.class).setParameter("userid", temp.getId()).getResultList();
		if(quotes.size()>0) {
			return quotes;
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		return em.createQuery(jpql, User.class).getResultList();
	}

	@Override
	public List<Pet> findPetByUser(User temp) {
		String query = "Select p from Pet p where user_id = :userid";
		List<Pet> pets = em.createQuery(query, Pet.class).setParameter("userid", temp.getId()).getResultList();
		if(pets.size()>0) {
			return pets;
		}
		return null;
	}
	

}
