package com.skilldistillery.fursurance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PetVaccinationTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private PetVaccination petVaccination;
	
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
		petVaccination = em.find(PetVaccination.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		petVaccination = null;
	}

//	@Test
//	void test_PetVaccine_entity_mappings() {
//		LocalDate date = LocalDate.parse("2016-08-12");
//		assertNotNull(petVaccination);
//		assertEquals(1, petVaccination.getVaccinationId());
//		assertEquals(date, petVaccination.getVaxDate());
//	}

}
