package com.skilldistillery.fursurance.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fursurance.entities.Pet;


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



}
