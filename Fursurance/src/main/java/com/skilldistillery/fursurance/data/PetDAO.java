package com.skilldistillery.fursurance.data;

import java.util.List;

import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Pet;

public interface PetDAO {
	
	public Pet findById(int petId);
	public Pet create(Pet pet);
	public List<MedicalCondition> getConditions();
	public MedicalCondition getCondition(int id);

}
