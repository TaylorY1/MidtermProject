package com.skilldistillery.fursurance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class VetTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Vet vet;

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
		vet = em.find(Vet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		vet = null;
	}

	@Test
	void test_initial_vet_entity_mapping() {
		assertNotNull(vet);
		assertEquals("harry",vet.getName());
	}
	@Test
	void test_vet_to_address_mapping() {
		assertNotNull(vet.getAddress());
		assertEquals("London",vet.getAddress().getCity());
	}

}
