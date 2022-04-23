package com.skilldistillery.fursurance.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class QuoteTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Quote quote;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf= Persistence.createEntityManagerFactory("JPAFursurance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em= emf.createEntityManager();
		quote = em.find(Quote.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		quote = null;
	}

	@Test
	void test_quote_entity_mappings() {
		assertNotNull(quote);
		assertEquals(200.00, quote.getDeductible());
		assertEquals(50, quote.getRiskScore());
	}

}
