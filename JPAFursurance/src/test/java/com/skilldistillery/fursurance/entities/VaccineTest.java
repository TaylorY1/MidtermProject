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

class VaccineTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Vaccine vaccination;
	
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
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		vaccination = null;
	}

	@Test
	void test1() {
		assertNotNull(vaccination);
	//	assertEquals(FIXME, Vaccination.getName());
	}

}
