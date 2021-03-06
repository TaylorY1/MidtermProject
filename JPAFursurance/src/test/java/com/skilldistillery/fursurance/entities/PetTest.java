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
		emf = Persistence.createEntityManagerFactory("JPAFursurance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		Pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		Pet = null;
	}

	@Test
	void test1_EntityMapping() {
		assertNotNull(Pet);
		assertEquals("sparky", Pet.getName());
	}

	@Test
	@DisplayName("pet to quote many to one mapping")
	void test2() {
		assertNotNull(Pet.getQuotes());
		assertTrue(Pet.getQuotes().size() > 0);
	}
	@Test
	void test3_Pet_ManyToOne_Species() {
		assertNotNull(Pet);
		assertEquals("dog", Pet.getSpecies().getName());

	}

	@Test
	@DisplayName("pet to pet vaccination many to one mapping")
	void test4() {
		assertNotNull(Pet.getVaccinations());
		assertTrue(Pet.getVaccinations().size() > 0);
	}
	@Test
	@DisplayName("pet to user  many to one mapping")
	void test5() {
		assertNotNull(Pet.getUser());
		assertEquals("admin", Pet.getUser().getUsername());
		assertEquals("admin",Pet.getUser().getPassword());
	}
	@Test
	@DisplayName("pet to breed  many to one mapping")
	void test6() {
		assertNotNull(Pet.getBreed());
		assertEquals("chihuahua", Pet.getBreed().getName());
	}
	@Test
	@DisplayName("pet to medical condition  many to many mapping")
	void test7() {
		assertNotNull(Pet.getConditions());
		assertTrue( Pet.getConditions().size() > 0);
	}
//	@Test
//	@DisplayName("pet to Vaccine  many to many mapping")
//	void test8() {
//		assertNotNull(Pet.getVaccines());
//		assertTrue( Pet.getVaccines().size() > 0);
//	}
		
}
