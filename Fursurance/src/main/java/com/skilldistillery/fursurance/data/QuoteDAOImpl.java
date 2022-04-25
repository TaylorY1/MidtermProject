package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Plan;
import com.skilldistillery.fursurance.entities.PlanTier;
import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.User;


@Service
@Transactional
public class QuoteDAOImpl implements QuoteDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Quote findById(int quoteId) {
		return em.find(Quote.class, quoteId);
	}
	
	@Override
	public List<Quote> findAll() {
		String jpql = "SELECT q FROM Quote q";
		return em.createQuery(jpql, Quote.class).getResultList();
	}
	
	@Override
	public Quote update(int id, Quote quote) {
		Quote managed = em.find(Quote.class, id); //refactor with  merge later
		managed.setId(quote.getId()); 
		managed.setDeductible(quote.getDeductible()); 
		managed.setRiskScore(quote.getRiskScore()); 
		managed.setCouponCode(quote.getCouponCode()); 
		managed.setCoverage(quote.getCoverage());  
		managed.setPlan(quote.getPlan());  
		managed.setUser(quote.getUser());  
		managed.setPet(quote.getPet()); 
		return managed;
	}
	
	@Override
	public Quote createQuote(Quote quote) {
		User tempUser = em.find(User.class, 2);
		Plan tempPlan = em.find(Plan.class, 1);
		PlanTier tempPlanTier = em.find(PlanTier.class, 1);
		
		quote.setPlan(tempPlan);
		quote.setUser(tempUser);
		quote.setTier(tempPlanTier);
		quote.getPet().setUser(tempUser);
		
		em.persist(quote.getPet());
		
		em.persist(quote);
		
		return quote;
	}

	@Override
	public Quote createQuotes(List<Quote> quotes) {
		// TODO Auto-generated method stub
		return null;
	}



}
