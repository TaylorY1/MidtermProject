package com.skilldistillery.fursurance.data;

import java.util.ArrayList;
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
		Quote managed = em.find(Quote.class, id); // refactor with merge later
		managed.setDeductible(quote.getDeductible());
		managed.setRiskScore(quote.getRiskScore());
		managed.setCouponCode(quote.getCouponCode());
		// managed.setCoverage(quote.getCoverage());
		managed.setCoverage(1);
		// do we need to be changing the plan, qoute, and user here?
		// managed.setPlan(quote.getPlan());
		// managed.setUser(quote.getUser());
		// managed.setPet(em.find(Pet.class, quote.getPet().getId()));
		return managed;
	}

	@Override
	public Quote createQuote(Quote quote, List<MedicalCondition> conditions, List<PetVaccination> vaccinations) {

		quote.getPet().setConditions(conditions);

		quote.getPet().setSpecies(em.find(Species.class, quote.getPet().getSpecies().getId()));
		quote.getPet().setBreed(em.find(Breed.class, quote.getPet().getBreed().getId()));

		quote.setPlan(em.find(Plan.class, 1)); // TODO logic for all 3 plans
		quote.setTier(em.find(PlanTier.class, 1)); // TODO logic for all 3 plan tiers

//		System.out.println("************************************");
//		System.out.println(quote.getPet());
//		System.out.println("************************************");
		em.persist(quote.getPet());
		em.persist(quote);

		return quote;
		
		
	}

	@Override

	public List<Quote> createQuotes(Quote quote, List<MedicalCondition> conditions, List<PetVaccination> vaccinations) {
		
		quote.getPet().setConditions(conditions);
		
		List<Quote> quotes = new ArrayList<>();
		Quote bronzeQuote = quote;

		/*
		 * RISK SCORE
		 * 
		 * Premium = Premium * RS
		 * 
		 * 1
		 * BEST
		 * Male, 0 - 2 years, Condition(count) = 0-2, Vax(count) = between ~ && ~ -2
		 * 
		 * 1.2
		 * Female, 0 - 2 years, Condition(count) = 0-2, Vax(count) = between ~ && ~ -2
		 * 
		 * 1.3
		 * Male/Female, 2 - 7 years, Condition(count) = 3-4, Vax(count) = between  -2 -4
		 * 
		 * 1.4
		 * Female, 2 - 7 years, Condition(count) = 3-4, Vax(count) = between  -2 -4
		 * 
		 * 1.5
		 * WORST
		 * 8+ years
		 * 
		 * quote.SetRiskScore(rs)
		 */
		
		double riskScore = 1;
		
		String jpql = "SELECT v FROM PetVaccination v";
		int maxVaccinations = em.createQuery(jpql, PetVaccination.class).getResultList().size();
		
		
		if (quote.getPet().getGender().equals("Male")) {
			riskScore = 1;
		} else {
			riskScore = 1.1; // female
		}
		
		if (quote.getPet().getConditions().size() >= 0 && quote.getPet().getConditions().size() <= 2) {
			riskScore *= 1;
		} else if (quote.getPet().getConditions().size() > 2 && quote.getPet().getConditions().size() <= 4) {
			riskScore *= 1.1;
		} else  {
			riskScore *= 1.2; // more than 4 conditions
		}
		
		if (quote.getPet().getVaccinations().size() >= maxVaccinations - 3
				&& quote.getPet().getVaccinations().size() >= maxVaccinations) {
			riskScore *= 1;
		} else {
			riskScore *= 1.2;
		}
		
		
		
		bronzeQuote.setUser(quote.getUser());
		bronzeQuote.setPlan(em.find(Plan.class, 1)); 
		bronzeQuote.setRiskScore(riskScore); 
		bronzeQuote.setPremium(em.find(Plan.class, 1).getBasePremium() * riskScore);
		bronzeQuote.setTier(em.find(PlanTier.class, 1)); 
		bronzeQuote.setPet(quote.getPet());
		
		System.out.println("******* bronzeQuote **********");
		System.out.println(bronzeQuote);
		System.out.println("******* bronzeQuote **********");
		
		Quote silverQuote = new Quote();
		silverQuote.setUser(quote.getUser());
		silverQuote.setPlan(em.find(Plan.class, 2)); 
		silverQuote.setRiskScore(riskScore); 
		silverQuote.setPremium(em.find(Plan.class, 2).getBasePremium() * riskScore);
		silverQuote.setTier(em.find(PlanTier.class, 2)); 
		silverQuote.setPet(quote.getPet());
		
		System.out.println("******* silverQuote **********");
		System.out.println(silverQuote);
		System.out.println("******* silverQuote **********");
		
		Quote goldQuote = new Quote();
		goldQuote.setUser(quote.getUser());
		goldQuote.setPlan(em.find(Plan.class, 3)); 
		goldQuote.setRiskScore(riskScore);
		goldQuote.setPremium(em.find(Plan.class, 3).getBasePremium() * riskScore);
		goldQuote.setTier(em.find(PlanTier.class, 3)); 
		goldQuote.setPet(quote.getPet());
		
		System.out.println("******* goldQuote **********");
		System.out.println(goldQuote);
		System.out.println("******* goldQuote **********");
		
		em.persist(quote.getPet());
	
		em.persist(quote);
		em.persist(silverQuote);
		em.persist(goldQuote);
		
		quotes.add(quote);
		quotes.add(silverQuote);
		quotes.add(goldQuote);
		
//		em.persist(quotes);
		

		return quotes;
	}

	@Override
	public boolean deleteById(Quote q) {
		// TODO: more to do here
		em.remove(q);
		return true;
	}

}
