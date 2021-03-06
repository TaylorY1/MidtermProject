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

class VaccineTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Vaccine vaccination;
	private Vaccine vaccine;
	
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
		vaccination = em.find(Vaccine.class, 1);
		vaccine = em.find(Vaccine.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		vaccine = null;
	}

	@Test
	void test_vaccine_entity_mapping() {
		assertNotNull(vaccine);
		assertEquals("Bordetella", vaccine.getName());
	}
//	@Test
//	@DisplayName("Many to many vaccine to pet")
//	void test2() {
//		assertNotNull(vaccine.getPets());
//		assertTrue( vaccine.getPets().size() > 0);
//	}

}
