package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.PetVaccination;
import com.skilldistillery.fursurance.entities.Species;
import com.skilldistillery.fursurance.entities.Vaccine;


@Service
@Transactional
public class PetDAOImpl implements PetDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Pet findById(int petId) {
		return em.find(Pet.class, petId);
	}
	
	
	@Override
	public Pet create(Pet pet) {
		em.persist(pet);
		return pet;
	}


	@Override
	public List<MedicalCondition> getConditions() {
		String jpql = "SELECT m FROM MedicalCondition m";
		List<MedicalCondition> testList = em.createQuery(jpql, MedicalCondition.class).getResultList();
		System.out.println("****************");
		System.out.println("******" + testList);
		System.out.println("****************");
		return testList;
	}


	@Override
	public MedicalCondition getCondition(int id) {
		return em.find(MedicalCondition.class, id);
	}
	
	@Override
	public Species getSpeciesById(int id) {
		return em.find(Species.class, id);
	}


	@Override
	public List<PetVaccination> getVaccinations() {
		
		String jpql = "SELECT p FROM PetVaccination p";
		List<PetVaccination> testList = em.createQuery(jpql, PetVaccination.class).getResultList();
		System.out.println("******VACCINATIONS**********");
		System.out.println("******" + testList);
		System.out.println("****************");
		return testList;
	}


	@Override
	public PetVaccination getVaccination(int id) {
		return em.find(PetVaccination.class, id);
	}


	@Override
	public List<Vaccine> getVaccines() {
		String jpql = "SELECT v FROM Vaccine v";
		List<Vaccine> testList = em.createQuery(jpql, Vaccine.class).getResultList();
		System.out.println("******VACCINES**********");
		System.out.println("******" + testList);
		System.out.println("****************");
		return testList;
	}


	@Override
	public Vaccine getVaccine(int id) {
		return em.find(Vaccine.class, id);
	}

}
