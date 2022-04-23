package com.skilldistillery.fursurance.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
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
	@Test
	@DisplayName("Plan to quote many to one mapping")
	void test2() {
		assertNotNull(quote.getPlan());
		assertEquals(50, quote.getPlan().getBasePremium());
		assertEquals(75, quote.getPlan().getDeductible());
	}
	@Test
	@DisplayName("Quote to plan tier many to one mapping")
	void test3() {
		assertNotNull(quote.getTier());
		assertEquals(80.22, quote.getTier().getCoverageAdjustment());
		assertEquals("bronze", quote.getTier().getName());
	}
	@Test
	@DisplayName("Quote to User many to one mapping")
	void test4() {
		assertNotNull(quote.getUser());
		assertEquals("test", quote.getUser().getPassword());
		assertEquals("tester", quote.getUser().getUsername());
	}
	@Test
	@DisplayName("Quote to Pet many to one mapping")
	void test5() {
		assertNotNull(quote.getPet());
		assertEquals("sparky", quote.getPet().getName());
		assertEquals("male", quote.getPet().getGender());
	}

}
