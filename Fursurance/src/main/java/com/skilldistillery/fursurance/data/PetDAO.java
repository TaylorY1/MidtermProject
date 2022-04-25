package com.skilldistillery.fursurance.data;

import com.skilldistillery.fursurance.entities.Pet;
import com.skilldistillery.fursurance.entities.User;

public interface PetDAO {
	
	public Pet findById(int petId);
	public Pet create(Pet pet);

}
