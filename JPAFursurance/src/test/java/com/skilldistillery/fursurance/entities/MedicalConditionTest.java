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

class MedicalConditionTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MedicalCondition mc;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		 emf = Persistence.createEntityManagerFactory("JPAFursurance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em= emf.createEntityManager();
		mc = em.find(MedicalCondition.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		mc = null;
	}

	@Test
	void test() {
		assertNotNull(mc);
		assertEquals("worms",mc.getName());

	}

}
