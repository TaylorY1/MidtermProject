package com.skilldistillery.fursurance.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Breed;
import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Pet;
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
//		quote.getPet().setVaccines(vaccines); // boom!
//		quote.getPet().setVaccinations(vaccinations); 

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
	public List<Quote> createQuotes(Quote quote) {
		List<Quote> quotes = new ArrayList<>();
		quotes.add(quote);
		System.out.println(quotes);
		
		for(int i = 2; i ==5; i ++) {
			Quote newQuote = quote;
			newQuote.setPlan(em.find(Plan.class, i));
			newQuote.setTier(em.find(PlanTier.class, i));
			quotes.add(newQuote);
			em.persist(newQuote);
			
		}
		System.out.println(quotes);

		return quotes;
	}

	@Override
	public boolean deleteById(Quote q) {
		// TODO: more to do here
		em.remove(q);
		return true;
	}

}
