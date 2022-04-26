package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Breed;
import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.PetVaccination;
import com.skilldistillery.fursurance.entities.Plan;
import com.skilldistillery.fursurance.entities.PlanTier;
import com.skilldistillery.fursurance.entities.Quote;
import com.skilldistillery.fursurance.entities.Species;
import com.skilldistillery.fursurance.entities.Vaccine;


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
		//i dont think update should be changing the id.
		managed.setId(quote.getId()); 
		managed.setDeductible(quote.getDeductible()); 
		managed.setRiskScore(quote.getRiskScore()); 
		managed.setCouponCode(quote.getCouponCode()); 
		managed.setCoverage(quote.getCoverage());  
		//do we need to be changing the plan, qoute, and user here?
		managed.setPlan(quote.getPlan());  
		managed.setUser(quote.getUser());  
		managed.setPet(quote.getPet()); 
		return managed;
	}
	
	@Override
	public Quote createQuote(Quote quote, List<MedicalCondition> conditions, List<Vaccine> vaccines) {
		
		quote.getPet().setConditions(conditions);
//		quote.getPet().setV(vaccines);
		
		quote.getPet().setSpecies(em.find(Species.class, quote.getPet().getSpecies().getId()));
		quote.getPet().setBreed(em.find(Breed.class, quote.getPet().getBreed().getId()));
		
		
		quote.setPlan(em.find(Plan.class, 1)); //TODO logic for all 3 plans
		quote.setTier(em.find(PlanTier.class, 1)); //TODO logic for all 3 plan tiers
		
		System.out.println("************************************");
		System.out.println(quote.getPet());
		System.out.println("************************************");
		em.persist(quote.getPet());
		em.persist(quote);
		
		return quote;
	}

	@Override
	public Quote createQuotes(List<Quote> quotes) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(Quote q) {
		//TODO: more to do here
		em.remove(q);
		return true;
	}



}
