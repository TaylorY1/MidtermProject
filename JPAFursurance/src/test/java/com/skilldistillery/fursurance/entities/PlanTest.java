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

class PlanTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Plan plan;
	
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
		plan = em.find(Plan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		plan = null;
	}

	@Test
	void test_plan_entity_mappings() {
		assertNotNull(plan);
		assertEquals(75, plan.getDeductible());
	}
	@Test
	@DisplayName("plan to quote many to one mapping")
	void test2() {
		assertNotNull(plan.getQuotes());
		assertTrue (plan.getQuotes().size() > 0);
	}

}
