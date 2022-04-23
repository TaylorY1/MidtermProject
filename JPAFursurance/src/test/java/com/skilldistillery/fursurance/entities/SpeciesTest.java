package com.skilldistillery.fursurance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SpeciesTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Species spec;

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
		spec = em.find(Species.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		spec = null;
	}

	@Test
	void test_Entity_mapping() {
		assertNotNull(spec);
		assertEquals("dog", spec.getName());

	}

	@Test
	void test_Species_OneToMany_Breed() {
		assertNotNull(spec);
		assertTrue(spec.getBreeds().size() > 0);
//		assertEquals(10, spec.getBreeds().size());
	}
	@Test
	void test_Species_OneToMany_Pet() {
		assertNotNull(spec);
		assertTrue(spec.getPets().size() > 0);
//		assertEquals(10, spec.getBreeds().size());
	}

}
