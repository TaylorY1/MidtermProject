package com.skilldistillery.fursurance.data;

import java.util.List;

import com.skilldistillery.fursurance.entities.Quote;

public interface QuoteDAO {
	
	public Quote findById(int quoteId);
	public List<Quote> findAll();
	public Quote update(int id, Quote quote);
	public Quote createQuote(Quote quote);
	public Quote createQuotes(List<Quote> quotes);
	
}
