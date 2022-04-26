package com.skilldistillery.fursurance.data;

import java.util.List;

import com.skilldistillery.fursurance.entities.MedicalCondition;
import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.PetVaccination;
import com.skilldistillery.fursurance.entities.Species;
import com.skilldistillery.fursurance.entities.Vaccine;

public interface PetDAO {
	
	public Pet findById(int petId);
	public Pet create(Pet pet);
	
	public List<MedicalCondition> getConditions();
	public MedicalCondition getCondition(int id);
	
	public List<PetVaccination> getVaccinations();
	public PetVaccination getVaccination(int id);
	
	public List<Vaccine> getVaccines();
	public Vaccine getVaccine(int id);
	
	public Species getSpeciesById(int id);

}
