package com.skilldistillery.fursurance.data;

import java.util.List;

import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Quote;

public interface QuoteDAO {
	
	public Quote findById(int quoteId);
	public List<Quote> findAll();
	public Quote update(int id, Quote quote);
	public Quote createQuote(Quote quote, List<MedicalCondition> conditions);
	public Quote createQuotes(List<Quote> quotes);
	public boolean deleteById(Quote q);
	
}
