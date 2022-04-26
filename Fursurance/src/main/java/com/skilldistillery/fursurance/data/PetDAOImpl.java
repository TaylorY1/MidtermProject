package com.skilldistillery.fursurance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.Quote;


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



}
