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

class PetTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Pet Pet;
	
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
		Pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		Pet = null;
	}

	@Test
	void test1() {
		assertNotNull(Pet);
		assertEquals("sparky", Pet.getName());
	}
	@Test
	@DisplayName("pet to quote many to one mapping")
	void test2() {
		assertNotNull(Pet.getQuotes());
		assertTrue( Pet.getQuotes().size() > 0);
	}

}
