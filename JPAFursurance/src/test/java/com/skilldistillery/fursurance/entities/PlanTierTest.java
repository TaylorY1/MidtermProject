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

class PlanTierTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private PlanTier pt;
	
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
		pt = em.find(PlanTier.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pt = null;
	}

	@Test
	void test() {
		assertNotNull(pt);
		assertEquals("bronze",pt.getName());
		assertEquals(80.22,pt.getCoverageAdjustment());
		//assertEquals(80.22,pt.getDeductibleAdjustment());
	}

}
