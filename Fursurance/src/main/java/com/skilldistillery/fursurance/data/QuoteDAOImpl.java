package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Quote;


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
	public Quote create(Quote quote) {
		em.persist(quote);
		return quote;
	}

}
